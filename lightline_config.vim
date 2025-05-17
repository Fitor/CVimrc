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
    \       'mode': 'lightline#cvstl#mode',
    \       'filename': 'lightline#cvstl#filename',
    \       'fileformat': 'lightline#cvstl#fileformat',
    \       'filetype': 'lightline#cvstl#filetype',
    \       'fileencoding': 'lightline#cvstl#fileencoding',
    \       'fugitive': 'lightline#cvstl#fugitive',
    \       'codeium': 'lightline#cvstl#codeium',
    \   }

let g:lightline.tab_component_function = {
            \ 'filename': 'lightline#tab#filename',
            \ 'tabname': 'lightline#cvstl#tabname',
            \}

let g:lightline.component_expand = {
    \       'cvim': 'lightline#cvstl#cvim',
    \       'tabcwd': 'lightline#cvstl#tabcwd',
    \       'wincwd': 'lightline#cvstl#wincwd',
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
func UpdateHandler(timer)
    call lightline#update()
endfunc
autocmd BufWinEnter * call timer_start(20, "UpdateHandler")
