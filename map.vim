" Vim File
" AUTHOR:   ci
" FILE:     map.vim
" ROLE:     TODO (some explanation)
" CREATED:  2018-01-22 15:38:04
" MODIFIED: 2018-01-22 15:40:28

if exists("g:map_config")
    if g:map_config == 2
        finish
    endif
else
    let g:map_config = 0
endif

" before
if g:map_config == 0
    let g:map_config = 1

    map ;t  :tabnew<CR>

endif

" last
if exists("g:configure_last")
    let g:map_config = 2
" ...
endif

