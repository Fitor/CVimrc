" Vim File
" AUTHOR:   ci
" FILE:     bufferhint_config.vim
" ROLE:     TODO (some explanation)
" CREATED:  2017-12-29 10:12:40
" MODIFIED: 2017-12-29 10:16:36

if exists("did_bufferhint_config")
    finish
endif
let did_bufferhint_config = 1

nnoremap - :call bufferhint#Popup()<CR>
nnoremap \ :call bufferhint#LoadPrevious()<CR>
