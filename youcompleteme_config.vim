" Vim File
" AUTHOR:   ci
" FILE:     youcompleteme_config.vim
" ROLE:     TODO (some explanation)
" CREATED:  2017-03-31 23:27:24
" MODIFIED: 2017-04-08 02:03:37

if exists("g:did_youcompleteme_config")
    if g:did_youcompleteme_config == 2
        finish
    endif
else
    let g:did_youcompleteme_config = 0
endif

" before
if g:did_youcompleteme_config == 0
    let g:did_youcompleteme_config = 1

    let g:ycm_error_symbol = '>>'
    let g:ycm_warning_symbol = '>*'

    nnoremap <leader>gl :YcmCompleter GoToDeclaration<CR>
    nnoremap <leader>gf :YcmCompleter GoToDefinition<CR>
    nnoremap <leader>gg :YcmCompleter GoToDefinitionElseDeclaration<CR>
    nmap <F4> :YcmDiags<CR>
endif

" last
if exists("g:configure_last")
    let g:did_youcompleteme_config = 2
endif

