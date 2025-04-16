command! CVNew call cvim#New()
command! -complete=custom,s:ListEditTypes -nargs=* CVEdit call cvim#Edit(<f-args>)
fun s:ListEditTypes(A,L,P)
    return "local\nglobal\nrg\ncvimrc-template\nrgconf-template\n"
endfun
command! CVCd call cvim#Cd()
command! CVTcd call cvim#Tcd()
command! CVLcd call cvim#Lcd()

nmap <silent> <leader>fg :call cvim#files()<CR>
nmap <silent> <leader>ff :call cvim#curfiles()<CR>
nmap <silent> <leader>ft :call cvim#grep()<CR>
nmap <silent> <leader>fr :call cvim#curgrep()<CR>

" :cd {cvimroot} after create new tab
autocmd! tabNew * call cvim#Cd()

" auto save/load tab name after save/load session
autocmd! SessionWritePost * call cvim#save_tabs_name()
autocmd! SessionLoadPost * call cvim#load_tabs_name()
