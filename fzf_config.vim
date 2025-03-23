" Vim File
if exists("g:did_fzf_config")
    finish
en
let g:did_fzf_config = 1

let g:fzf_vim = {}
let g:fzf_vim.listproc = { list -> fzf#vim#listproc#quickfix(list) }
