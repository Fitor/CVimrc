" custom command suggesting git commit message, takes no arguments
function! s:CommitMessage(range)
    let l:range = 0
    let l:diff = system('git diff --staged')
    let l:prompt = "generate a short commit message from the diff below:\n" . l:diff
    let l:config = {
                \  "options": {
                \    "initial_prompt": ">>> system\nyou are a code assistant",
                \    "temperature": 1,
                \  },
                \}
    call vim_ai#AIRun(l:range, l:config, l:prompt)
endfunction

" custom command that provides a code review for selected code block
function! s:CodeReview(range)
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
    en
endfunction

fun vimai#prompt#Complete(A,L,P)
    return "CommitMessage\nCodeReview\n"
endfun

fu! vimai#prompt#Exec(range, ...)
    if a:0 == 0
        echom "Error: No prompt type specified"
        return
    endif
    
    let l:prompt_type = a:1

    if l:prompt_type == 'CommitMessage'
        call s:CommitMessage(a:range)
    elseif l:prompt_type == 'CodeReview'
        call s:CodeReview(a:range)
    else
        echom 'Error: Unknown prompt' . l:prompt_type
        retu
    en
endf
