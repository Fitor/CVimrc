" Vim File
" AUTHOR:   ci
" FILE:     quickfix_config.vim
" ROLE:     TODO (some explanation)
" CREATED:  2017-12-26 14:02:24
" MODIFIED: 2018-01-02 18:18:51

if exists("did_quickfix_config")
    finish
endif
let did_quickfix_config = 1

map <leader>qo :cw<CR>
map <leader>qc :ccl<CR>
map <leader>qf :cfirst<CR>
map <leader>qn :cnext<CR>
map <leader>qp :cprev<CR>
map <leader>ql :clast<CR>
