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
    \           [ 'fugitive', 'filename', 'wincwd' ],
    \           [ 'codeium' ]
    \       ]
    \   }

let g:lightline.tabline = {
    \       'left': [
    \           [ 'tabs' ]
    \       ],
    \       'right': [
    \           [ 'close', 'tabcwd', 'cvim' ]
    \       ]
    \   }

let g:lightline.tab = {
            \ 'active': [ 'tabnum', 'tabname', 'filename', 'modified' ],
            \ 'inactive': [ 'tabnum','tabname', 'filename', 'modified' ] }

let g:lightline.component = {
    \   }

let g:lightline.component_function = {
    \       'mode': 'lightline#stl#mode',
    \       'filename': 'lightline#stl#filename',
    \       'fileformat': 'lightline#stl#fileformat',
    \       'filetype': 'lightline#stl#filetype',
    \       'fileencoding': 'lightline#stl#fileencoding',
    \       'fugitive': 'lightline#stl#fugitive',
    \       'codeium': 'lightline#stel#codeium',
    \   }

let g:lightline.tab_component_function = {
            \ 'filename': 'lightline#tab#filename',
            \ 'tabname': 'lightline#stl#tabname',
            \}

let g:lightline.component_expand = {
    \       'cvim': 'lightline#stl#cvim',
    \       'tabcwd': 'lightline#stl#tabcwd',
    \       'wincwd': 'lightline#stl#wincwd',
    \   }

let g:lightline.component_type = {
    \       'cvim': 'cvim',
    \       'tabcwd': 'tabcwd',
    \       'wincwd': 'wincwd',
    \   }

let g:lightline.component_visible_condition = {
    \       'mode':     '(&filetype!="startify" && &filetype!="nerdtree")',
    \   }

" startify
autocmd User StartifyReady call lightline#update()

" for update wincwd after :lcd
autocmd DirChanged * call lightline#update()
