if exists("g:map_config") && g:map_config
    finish
endif
let g:map_config = 1

" tabpage
nmap ;tn  :tabnew<CR>
nmap ;tc  :tabc<CR>
