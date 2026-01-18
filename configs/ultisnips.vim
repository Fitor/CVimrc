if exists("g:did_snipmate_config")
    finish
endif
let g:did_snipmate_config = 1

let g:snipMate = { 'snippet_version' : 1 }

imap <TAB> <Plug>snipMateTrigger
imap <C-J> <Plug>snipMateNextOrTrigger
smap <C-J> <Plug>snipMateNextOrTrigger
imap <C-K> <Plug>snipMateBack
smap <C-K> <Plug>snipMateBack

