command! CVNew call cvim#New()
command! -complete=custom,s:ListEditTypes -nargs=* CVEdit call cvim#Edit(<f-args>)
fun s:ListEditTypes(A,L,P)
    return "local\nglobal\nrg\ncvimrc-template\nrgconf-template\n"
endfun

nmap <silent> <leader>fg :call cvim#files()<CR>
nmap <silent> <leader>ff :call cvim#curfiles()<CR>
nmap <silent> <leader>ft :call cvim#grep()<CR>
nmap <silent> <leader>fr :call cvim#curgrep()<CR>
