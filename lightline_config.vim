" Vim File
" AUTHOR:   ci
" FILE:     lightline_config.vim
" ROLE:     TODO (some explanation)
" CREATED:  2017-03-31 23:27:24
" MODIFIED: 2017-04-01 01:27:46

if exists("did_lightline_config")
    finish
endif
let did_lightline_config = 1

set laststatus=2

let g:lightline = {
    \       'colorscheme': 'cvim',
    \       'separator': { 'left': '', 'right': '' },
    \       'subseparator': { 'left': '|', 'right': '|' }
    \   }

let g:lightline.active = {
    \       'left': [
    \           [ 'mode', 'paste' ],
    \           [ 'fugitive', 'filename' ],
    \           [ 'codeium' ]
    \       ]
    \   }

let g:lightline.tabline = {
    \       'left': [
    \           [ 'tabs' ]
    \       ],
    \       'right': [
    \           [ 'close', 'cwd', 'cvim' ]
    \       ]
    \   }

let g:lightline.component = {
    \   }

let g:lightline.component_function = {
    \       'mode': 'LightlineMode',
    \       'filename': 'LightlineFilename',
    \       'fileformat': 'LightlineFileformat',
    \       'filetype': 'LightlineFiletype',
    \       'fileencoding': 'LightlineFileencoding',
    \       'fugitive': 'LightlineFugitive',
    \       'codeium': 'LightlineCodeium',
    \   }

let g:lightline.component_expand = {
    \       'cvim': 'LightlineCvim',
    \       'cwd': 'LightlineCWD',
    \   }

let g:lightline.component_type = {
    \       'cvim': 'cvim',
    \       'cwd': 'cwd',
    \   }

let g:lightline.component_visible_condition = {
    \       'mode':     '(&filetype!="startify" && &filetype!="nerdtree")',
    \   }

" basic
function! LightlineMode()
    let fname = expand('%:t')
    return fname =~# 'NERD_tree' ? 'NERDTree' :
                \ &ft ==# 'startify' ? 'Startify' :
                \ winwidth(0) > 60 ? lightline#mode() : ''
endfunction

function! LightlineModified()
    return &ft ==# 'help' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! LightlineReadonly()
    return &ft !~? 'help' && &readonly ? 'RO' : ''
endfunction

function! LightlineFilename()
    let fname = expand('%:t')
    return fname =~# '^__Tagbar__\|__Gundo\|NERD_tree' ? '' :
                \ &ft ==# 'startify' ? '' :
                \ (LightlineReadonly() !=# '' ? LightlineReadonly() . ' ' : '') .
                \ (fname !=# '' ? fname : '[No Name]') .
                \ (LightlineModified() !=# '' ? ' ' . LightlineModified() : '')
endfunction

function! LightlineFileformat()
    return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! LightlineFiletype()
    return winwidth(0) > 70 ? (&filetype !=# '' ? &filetype : 'no ft') : ''
endfunction

function! LightlineFileencoding()
    return winwidth(0) > 70 ? (&fenc !=# '' ? &fenc : &enc) : ''
endfunction

" cvim
function! LightlineCvim()
    if exists('g:cvimroot')
        return cvim#puttypath(g:cvimroot)
    endif
    return ''
endfunction

" cwd
function! LightlineCWD()
    return cvim#puttypath(getcwd())
endfunction

" startify
autocmd User StartifyReady call lightline#update()

" fugitive
function! LightlineFugitive()
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
function! LightlineCodeium()
    if exists('g:loaded_codeium')
        return codeium#GetStatusString()
    endif
    return ''
endfunction
