command! CVNew call cvim#New()
command! CVEdit call cvim#Edit()
command! CVEditGlobal call cvim#EditGlobal()

nmap <silent> <leader>f :call cvim#files()<CR>
