" Vim File
" AUTHOR:   Ci
" FILE:     ci_vimrc_config.vim
" ROLE:     TODO (some explanation)
" CREATED:  2017-07-13 14:15:00
" MODIFIED: 2017-07-13 14:15:39

if exists("g:did_ci_vimrc_config")
    finish
endif
let g:did_ci_vimrc_config = 1

if filereadable($PWD . "/.ci_vimrc")
    source $PWD/.ci_vimrc
endif
