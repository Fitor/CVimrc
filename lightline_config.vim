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
    \       'colorscheme': 'landscape',
    \       'mode_map': {
    \           'c': 'SEARCH'
    \       },
    \       'separator': { 'left': '', 'right': '' },
    \       'subseparator': { 'left': '|', 'right': '|' }
    \   }

let g:lightline.active = {
    \       'left': [
    \           [ 'mode', 'paste' ],
    \           [ 'gitbranch', 'readonly', 'filename', 'modified' ],
    \           [ 'codeium' ]
    \       ]
    \   }

let g:lightline.tabline = {
    \       'left': [
    \           [ 'cvim', 'tabs' ]
    \       ],
    \       'right': [
    \           [ 'close' ]
    \       ]
    \   }

let g:lightline.component = {
    \       'mode':     '%{(&filetype=="startify" || &filetype=="nerdtree") ? "" : lightline#mode()}',
    \       'filename': '%{(&filetype=="startify" || &filetype=="nerdtree") ? "" : expand("%:t")}',
    \       'readonly': '%{(&filetype=="help" || &filetype=="startify" || &filetype=="nerdtree") ? "" : &readonly ? "x" : ""}',
    \       'modified': '%{(&filetype=="help" || &filetype=="startify" || &filetype=="nerdtree") ? "" : &modified ? "+" : &modifiable ? "" : "-"}'
    \   }

let g:lightline.component_function = {
    \       'codeium': 'LightlineCodeiumStatus',
    \       'gitbranch': 'FugitiveHead'
    \   }

let g:lightline.component_expand = {
    \       'cvim': 'LightlineCvimStatus'
    \   }

let g:lightline.component_type = {
    \       'cvim': 'error'
    \   }

let g:lightline.component_visible_condition = {
    \       'mode':     '(&filetype!="startify" && &filetype!="nerdtree")',
    \       'filename': '(&filetype!="startify" && &filetype!="nerdtree")',
    \       'readonly': '(&filetype!="help" && &filetype!="startify" && &filetype!="nerdtree" && &readonly)',
    \       'modified': '(&filetype!="help" && &filetype!="startify" && &filetype!="nerdtree" && (&modified || !&modifiable))'
    \   }

function! LightlineCodeiumStatus()
    if exists('g:loaded_codeium')
        return codeium#GetStatusString()
    endif
    return ''
endfunction

function! LightlineCvimStatus()
    if exists('g:cvimroot')
        return cvim#puttypath(g:cvimroot)
    endif
    return ''
endfunction
