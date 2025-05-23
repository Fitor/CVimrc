if exists("g:did_nerdtree_config")
    finish
endif
let g:did_nerdtree_config = 1

nmap <leader>e :NERDTreeToggle<cr>
autocmd bufenter * if (winnr("$") ==1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

let g:NERDTreeStatusline = -1
let g:NERDTreeUseTCD = -1

if exists("g:cvimroot")
    let g:NERDTreeBookmarksFile = g:cvimroot."/.cvim/NERDTreeBookmarks"
endif
