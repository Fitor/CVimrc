" custom command suggesting git commit message, takes no arguments
function! s:PromptCommitMessage(range) abort
    let l:diff = system('git diff --staged')
    if v:shell_error != 0
        echom 'Error: Failed to get git diff'
        return
    endif
    let l:prompt = "generate a short commit message from the diff below:\n" . l:diff
    let l:config = {
                \  "options": {
                \    "initial_prompt": ">>> system\nyou are a code assistant",
                \    "temperature": 1,
                \  },
                \}
    call vim_ai#AIRun(0, l:config, l:prompt)
endfunction

" custom command to review git staged code, takes no arguments
function! s:PromptReviewStaged(range) abort
    let l:diff = system('git diff --staged')
    if v:shell_error != 0
        echom 'Error: Failed to get git diff'
        return
    endif
    let l:prompt = "programming syntax is " . &filetype . ", review the staged changes below:\n" . l:diff
    let l:config = {
                \  "options": {
                \    "initial_prompt": ">>> system\nyou are a code review expert",
                \    "temperature": 0.7,
                \  },
                \}
    call vim_ai#AIChatRun(0, l:config, l:prompt)
endfunction

" custom command that provides a code review for selected code block
function! s:PromptCodeReview(range) abort
    let l:prompt = "programming syntax is " . &filetype . ", review the code below"
    let l:config = {
                \  "options": {
                \    "initial_prompt": ">>> system\nyou are a clean code expert",
                \  },
                \}
    if a:range
        '<,'>call vim_ai#AIChatRun(1, l:config, l:prompt)
    else
        %call vim_ai#AIChatRun(1, l:config, l:prompt)
    endif
endfunction

let s:prompts = {}
let s:prompt_completions = ''

function! s:InitPrompts()
    let l:sid = expand('<SID>')
    let l:all_funcs = split(execute('function'), '\n')

    let l:completions = []

    for l:line in l:all_funcs
        " 匹配当前脚本的局部函数（格式：SNR_123_funcname）
        if l:line =~ '^\s*function ' . l:sid . 'Prompt\w\+('
            let l:func = matchstr(l:line, '^\s*\zsfunction <SNR>\d\+_\w\+\ze(')
            let l:func = substitute(l:func, 'function ', '', '')
            let l:name = substitute(l:func, '<SNR>\d\+_Prompt', '', '')
            let s:prompts[l:name] = l:func
            call add(l:completions, l:name)
        endif
    endfor

    let s:prompt_completions = join(l:completions, "\n")
endfunction

fun vimai#prompt#Complete(A,L,P) abort
    if empty(s:prompts)
        call s:InitPrompts()
    endif

    return s:prompt_completions
endfun

fu! vimai#prompt#Exec(range, ...) abort
    if empty(s:prompts)
        call s:InitPrompts()
    endif

    if a:0 == 0
        echom "Error: No prompt type specified"
        return
    endif
    
    let l:type = a:1

    if exists('s:prompts[l:type]')
        exec 'call ' . s:prompts[l:type].'('.a:range.')'
    else
        echom 'Error: Unknown prompt ' . l:type
        retu
    endif
endf
