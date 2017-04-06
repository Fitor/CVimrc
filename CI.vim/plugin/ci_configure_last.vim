" Vim File
" AUTHOR:   kimson
" FILE:     ci_configure_last.vim
" ROLE:     TODO (some explanation)
" CREATED:  2017-04-06 19:23:40
" MODIFIED: 2017-04-06 20:25:59

if exists("g:did_ci_configure_last")
    finish
endif
let g:did_ci_configure_last = 1

" code_complete configure
if filereadable($HOME . "/.vim/MyVinrc/code_complete_config.vim")
    source $HOME/.vim/MyVinrc/code_complete_config.vim
endif
