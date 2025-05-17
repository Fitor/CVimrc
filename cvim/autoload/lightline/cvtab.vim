function! lightline#cvtab#filename(n) abort
    let buflist = tabpagebuflist(a:n)
    let winnr = tabpagewinnr(a:n)
    let ft = getbufvar(buflist[winnr - 1], '&filetype')
    let _ = expand('#'.buflist[winnr - 1].':t')
    return ft ==# 'startify' ? '[STARTIFY]' :
                \ ft ==# 'nerdtree' ? '[NERDTREE]' :
                \ ft ==# 'tabman' ? '[TABMAN]' :
                \ ft ==# 'fugitive' ? '[FUGITIVE]' :
                \ ft ==# 'fugitiveblame' ? '[FUGITIVEBLAME]' :
                \ ft ==# 'gitcommit' ? '[GITCOMMIT]' :
                \ _ !=# '' ? _ : '[No Name]'
endfunction
