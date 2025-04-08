command! CVNew call cvim#New()
command! CVEdit call cvim#Edit()
command! CVEditGlobal call cvim#EditGlobal()

nmap <silent> <leader>fg :call cvim#files()<CR>
nmap <silent> <leader>ff :call cvim#curfiles()<CR>
nmap <silent> <leader>ft :call cvim#grep()<CR>
nmap <silent> <leader>fr :call cvim#curgrep()<CR>
