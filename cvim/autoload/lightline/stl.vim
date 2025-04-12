" basic
function! lightline#stl#mode()
    let fname = expand('%:t')
    return fname =~# 'NERD_tree' ? 'NERDTree' :
                \ &ft ==# 'startify' ? 'Startify' :
                \ winwidth(0) > 60 ? lightline#mode() : ''
endfunction

function! lightline#stl#modified()
    return &ft ==# 'help' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! lightline#stl#readonly()
    return &ft !~? 'help' && &readonly ? 'RO' : ''
endfunction

function! lightline#stl#filename()
    let fname = expand('%:t')
    return fname =~# '^__Tagbar__\|__Gundo\|NERD_tree' ? '' :
                \ &ft ==# 'startify' ? '' :
                \ (lightline#stl#readonly() !=# '' ? lightline#stl#readonly() . ' ' : '') .
                \ (fname !=# '' ? fname : '[No Name]') .
                \ (lightline#stl#modified() !=# '' ? ' ' . lightline#stl#modified() : '')
endfunction

function! lightline#stl#fileformat()
    return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! lightline#stl#filetype()
    return winwidth(0) > 70 ? (&filetype !=# '' ? &filetype : 'no ft') : ''
endfunction

function! lightline#stl#fileencoding()
    return winwidth(0) > 70 ? (&fenc !=# '' ? &fenc : &enc) : ''
endfunction

" cvim
function! lightline#stl#cvim()
    if exists('g:cvimroot')
        return cvim#puttypath(g:cvimroot)
    endif
    return ''
endfunction

" cwd
function! lightline#stl#cwd()
    if exists('g:cvimroot')
        let p = cvim#utils#relpath(getcwd(), g:cvimroot)
        return cvim#puttypath(p)
    else
        return cvim#puttypath(getcwd())
    endif
endfunction

function! lightline#stl#tabcwd()
    if exists('g:cvimroot')
        let p = cvim#utils#relpath(getcwd(-1, 0), g:cvimroot)
        let p = cvim#puttypath(p)
    else
        let p = cvim#puttypath(getcwd(-1, 0))
    endif

    if haslocaldir(-1, 0) == 2
        " tab-local directory case
        return p.'[t]'
    else
        " global directory case
        return p
    endif
endfunction

function! lightline#stl#wincwd()
    if haslocaldir() == 1
        " window local directory case
        if exists('g:cvimroot')
            let p = cvim#utils#relpath(getcwd(), g:cvimroot)
            return cvim#puttypath(p)
        else
            return cvim#puttypath(getcwd())
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
function! lightline#stl#fugitive()
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
function! lightline#stel#codeium()
    if exists('g:loaded_codeium')
        return codeium#GetStatusString()
    endif
    return ''
endfunction
