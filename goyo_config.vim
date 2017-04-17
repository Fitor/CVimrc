" Vim File
" AUTHOR:   ci
" FILE:     goyo_config.vim
" ROLE:     TODO (some explanation)
" CREATED:  2017-03-31 23:27:24
" MODIFIED: 2017-04-17 10:58:21

if exists("g:did_goyo_config")
    if g:did_goyo_config == 2
        finish
    endif
else
    let g:did_goyo_config = 0
endif

" before
if g:did_goyo_config == 0
    let g:did_goyo_config = 1

nmap <leader>g :Goyo<CR>

endif

" last
if exists("g:configure_last")
    let g:did_goyo_config = 2

endif

