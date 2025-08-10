if exists("g:did_tabman_config")
    finish
en
let g:did_tabman_config = 1

nmap <leader>tt  :TMToggle<CR>
nmap <leader>tn  :tabnew<CR>
nmap <leader>tc  :tabc<CR>
