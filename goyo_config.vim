" Vim File
" AUTHOR:   ci
" FILE:     goyo_config.vim
" ROLE:     TODO (some explanation)
" CREATED:  2017-03-31 23:27:24
" MODIFIED: 2017-07-26 14:23:58

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

let g:goyo_width = '80%'
let g:goyo_height = '85%'
let g:goyo_linenr = 1

endif

" last
if exists("g:configure_last")
    let g:did_goyo_config = 2

endif

