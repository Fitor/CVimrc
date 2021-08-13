" Vim File
" AUTHOR:   ci
" FILE:     clang_format_config.vim
" ROLE:     TODO (some explanation)
" CREATED:  2021-08-13 09:53:42
" MODIFIED: 2021-08-13 09:53:42

if exists("did_clang_format_config")
    finish
endif
let did_clang_format_config = 1

let g:clang_format#auto_format = 1

let g:clang_format#style_options = {
            \ "AccessModifierOffset" : -4,
            \ "AllowShortIfStatementsOnASingleLine" : "true",
            \ "AlwaysBreakTemplateDeclarations" : "true",
            \ "Standard" : "C++11"}
