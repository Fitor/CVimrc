" basic
function! lightline#cvstl#mode()
    let fname = expand('%:t')
    return fname =~# 'NERD_tree' ? 'NERDTree' :
                \ &ft ==# 'startify' ? 'Startify' :
                \ winwidth(0) > 60 ? lightline#mode() : ''
endfunction

function! lightline#cvstl#modified()
    return &ft ==# 'help' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! lightline#cvstl#readonly()
    return &ft !~? 'help' && &readonly ? 'RO' : ''
endfunction

function! lightline#cvstl#filename()
    let fname = expand('%:t')
    return fname =~# '^__Tagbar__\|__Gundo\|NERD_tree' ? '' :
                \ &ft ==# 'startify' ? '' :
                \ &ft ==# 'fugitive' ? '' :
                \ &ft ==# 'fugitiveblame' ? '' :
                \ &ft ==# 'gitcommit' ? '' :
                \ (lightline#cvstl#readonly() !=# '' ? lightline#cvstl#readonly() . ' ' : '') .
                \ (fname !=# '' ? fname : '[No Name]') .
                \ (lightline#cvstl#modified() !=# '' ? ' ' . lightline#cvstl#modified() : '')
endfunction

function! lightline#cvstl#fileformat()
    return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! lightline#cvstl#filetype()
    return winwidth(0) > 70 ? (&filetype !=# '' ? &filetype : 'no ft') : ''
endfunction

function! lightline#cvstl#fileencoding()
    return winwidth(0) > 70 ? (&fenc !=# '' ? &fenc : &enc) : ''
endfunction

" cvim
function! lightline#cvstl#cvim()
    if exists('g:cvimroot')
        return cvim#prettypath(g:cvimroot)
    endif
    return ''
endfunction

" cwd
function! lightline#cvstl#cwd()
    if exists('g:cvimroot')
        let p = cvim#utils#relpath(getcwd(), g:cvimroot)
        return cvim#prettypath(p)
    else
        return cvim#prettypath(getcwd())
    endif
endfunction

function! lightline#cvstl#tabcwd()
    if exists('g:cvimroot')
        let p = cvim#utils#relpath(getcwd(-1, 0), g:cvimroot)
        let p = cvim#prettypath(p)
    else
        let p = cvim#prettypath(getcwd(-1, 0))
    endif

    if haslocaldir(-1, 0) == 2
        " tab-local directory case
        return p.'[t]'
    else
        " global directory case
        return p
    endif
endfunction

function! lightline#cvstl#wincwd()
    if haslocaldir() == 1
        " window local directory case
        if exists('g:cvimroot')
            let p = cvim#utils#relpath(getcwd(), g:cvimroot)
            return cvim#prettypath(p)
        else
            return cvim#prettypath(getcwd())
        endif
    elseif haslocaldir() == 2
        " tab-local directory case
        return ''
    else
        " global directory case
        return ''
    endif
endfunction

" fugitive
function! lightline#cvstl#fugitive()
    try
        if expand('%:t') !~? 'Tagbar\|Gundo\|NERD' && &ft !~? 'vimfiler\|startify' && exists('*FugitiveHead')
            let mark = ''  " edit here for cool mark
            let branch = FugitiveHead()
            return branch !=# '' ? mark.branch : ''
        endif
    catch
    endtry
    return ''
endfunction

" codeium
function! lightline#cvstl#codeium()
    if exists('g:loaded_codeium')
        return codeium#GetStatusString()
    endif
    return ''
endfunction

" tabname
function! lightline#cvstl#tabname(n)
    let name = gettabvar(a:n, 'cvname')
    return empty(name) ? '' : '['.name.']'
endfunction
