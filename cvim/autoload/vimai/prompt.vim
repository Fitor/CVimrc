" custom command suggesting git commit message, takes no arguments
function! vimai#prompt#CommitMessage()
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
function! vimai#prompt#CodeReview(range) range
    let l:prompt = "programming syntax is " . &filetype . ", review the code below"
    let l:config = {
                \  "options": {
                \    "initial_prompt": ">>> system\nyou are a clean code expert",
                \  },
                \}
    '<,'>call vim_ai#AIChatRun(a:range, l:config, l:prompt)
endfunction
