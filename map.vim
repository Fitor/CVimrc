if exists("g:map_config") && g:map_config
    finish
endif
let g:map_config = 1

" tabpage
nmap <leader>tt  :TMToggle<CR>
nmap <leader>tn  :tabnew<CR>
nmap <leader>tc  :tabc<CR>
