" Vim File
" AUTHOR:   ci
" FILE:     codeium_config.vim
" ROLE:     TODO (some explanation)
" CREATED:  2024-09-06 13:52:24
" MODIFIED: 2024-09-06 13:52:24

if exists("did_codeium_config")
    finish
endif
let did_codeium_config = 1
let g:codeium_disable_bindings = 1

nmap <silent> <leader>ao :Codeium Enable<CR>
nmap <silent> <leader>ac :Codeium Disable<CR>
imap <script><silent><nowait><expr> <leader>aa codeium#Accept()
imap <leader>aj <Cmd>call codeium#CycleCompletions(1)<CR>
imap <leader>ak <Cmd>call codeium#CycleCompletions(-1)<CR>
