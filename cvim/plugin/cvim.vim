command! CVNew call cvim#New()
command! -complete=custom,s:ListEditTypes -nargs=* CVEdit call cvim#Edit(<f-args>)
fun s:ListEditTypes(A,L,P)
    return "local\nglobal\nrg\ncvimrc-template\nrgconf-template\n"
endfun
command! CVCd call cvim#Cd()
command! CVTcd call cvim#Tcd()
command! CVLcd call cvim#Lcd()

" :cd {cvimroot} after create new tab
autocmd! tabNew * call cvim#Tcd()

" auto save/load tab name after save/load session
autocmd! SessionWritePost * call cvim#save_tabs_name()
autocmd! SessionLoadPost * call cvim#load_tabs_name()

" update window cwd
autocmd! BufEnter,WinEnter * call cvim#update_win_cwd()

" vim-ai prompt commands
command! -complete=custom,vimai#prompt#Complete -range -nargs=1 AIPrompt call vimai#prompt#Exec(<range>, <f-args>)
