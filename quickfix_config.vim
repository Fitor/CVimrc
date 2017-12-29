" Vim File
" AUTHOR:   ci
" FILE:     quickfix_config.vim
" ROLE:     TODO (some explanation)
" CREATED:  2017-12-26 14:02:24
" MODIFIED: 2017-12-26 14:11:59

if exists("did_quickfix_config")
    finish
endif
let did_quickfix_config = 1

map <leader><leader>o :cw<CR>
map <leader><leader>c :ccl<CR>
map <leader><leader>f :cfirst<CR>
map <leader><leader>n :cnext<CR>
map <leader><leader>p :cprev<CR>
map <leader><leader>l :clast<CR>
