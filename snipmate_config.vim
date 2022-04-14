" Vim File
" AUTHOR:   ci
" FILE:     snipmate_config.vim
" ROLE:     TODO (some explanation)
" CREATED:  2018-01-23 13:45:55
" MODIFIED: 2018-01-25 20:37:19

if exists("g:did_snipmate_config")
    if g:did_snipmate_config == 2
        finish
    endif
else
    let g:did_snipmate_config = 0
endif

" before
if g:did_snipmate_config == 0
    let g:did_snipmate_config = 1

    let g:snipMate = { 'snippet_version' : 1 }
endif

" last
if exists("g:configure_last")
    let g:did_snipmate_config = 2

    imap <TAB> <Plug>snipMateTrigger
    imap <C-J> <Plug>snipMateNextOrTrigger
    smap <C-J> <Plug>snipMateNextOrTrigger
    imap <C-K> <Plug>snipMateBack
    smap <C-K> <Plug>snipMateBack
endif

