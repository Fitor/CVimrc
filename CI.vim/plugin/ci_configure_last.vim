" Vim File
" AUTHOR:   kimson
" FILE:     ci_configure_last.vim
" ROLE:     TODO (some explanation)
" CREATED:  2017-04-06 19:23:40
" MODIFIED: 2018-01-25 20:26:40

if exists("g:did_ci_configure_last")
    finish
endif
let g:did_ci_configure_last = 1

" code_complete configure
if isdirectory($HOME . "/.vim/bundle/vim-snipmate")
    if filereadable($HOME . "/.vim/MyVinrc/snipmate_config.vim")
        source $HOME/.vim/MyVinrc/snipmate_config.vim
    endif
endif
