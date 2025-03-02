" Vim File
" AUTHOR:   ci
" FILE:     ctrlp-funky_config.vim
" ROLE:     TODO (some explanation)
" CREATED:  2017-03-31 23:27:24
" MODIFIED: 2017-07-05 08:53:42

if exists("did_ctrlp_funky_config")
    finish
endif
let did_ctrlp_funky_config = 1

nnoremap <Leader>fu :CtrlPFunky<Cr>
" narrow the list down with a word under cursor
nnoremap <Leader>fU :execute 'CtrlPFunky ' . expand('<cword>')<Cr>
let g:ctrlp_funky_syntax_highlight = 1

let g:ctrlp_extensions = ['funky']
