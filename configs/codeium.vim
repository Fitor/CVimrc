" Vim File
" AUTHOR:   ci
" FILE:     codeium_config.vim
" ROLE:     TODO (some explanation)
" CREATED:  2024-09-06 13:52:24
" MODIFIED: 2024-09-06 13:52:24

if exists("did_codeium_config")
    finish
endif
let did_codeium_config = 1

if !exists('g:loaded_codeium')
    finish
endif

let g:codeium_disable_bindings = 1
