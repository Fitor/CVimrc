" Vim File
" AUTHOR:   kimson
" FILE:     ci_configure_last.vim
" ROLE:     TODO (some explanation)
" CREATED:  2017-04-06 19:23:40
" MODIFIED: 2017-04-07 00:21:34

if exists("g:did_ci_configure_last")
    finish
endif
let g:did_ci_configure_last = 1

" code_complete configure
if isdirectory($HOME . "/.vim/bundle/code_complete")
    if filereadable($HOME . "/.vim/MyVinrc/code_complete_config.vim")
        source $HOME/.vim/MyVinrc/code_complete_config.vim
    endif
endif
