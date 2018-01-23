" Vim File
" AUTHOR:   ci
" FILE:     syntax.vim
" ROLE:     TODO (some explanation)
" CREATED:  2018-01-22 16:43:18
" MODIFIED: 2018-01-22 16:46:25

if exists("syntax_config")
    finish
endif
let syntax_config = 1

highlight extraSpace  ctermbg=red guibg=red
match extraSpace /\v\s+$/
