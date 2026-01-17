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
