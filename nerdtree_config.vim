" Vim File
" AUTHOR:   ci
" FILE:     code_complete.vim
" ROLE:     TODO (some explanation)
" CREATED:  2017-03-31 23:27:24
" MODIFIED: 2017-04-07 09:21:31

if exists("g:did_nerdtree_config")
    if g:did_nerdtree_config == 2
        finish
    endif
else
    let g:did_nerdtree_config = 0
endif

" before
if g:did_nerdtree_config == 0
    let g:did_nerdtree_config = 1
    nmap <leader>n :NERDTreeToggle<cr>
    autocmd bufenter * if (winnr("$") ==1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
endif

" last
if exists("g:configure_last")
    let g:did_nerdtree_config = 2
endif

