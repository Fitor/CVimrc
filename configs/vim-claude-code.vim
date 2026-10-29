" Vim File
" AUTHOR:   ci
" FILE:     vim-claude-code_config.vim
" ROLE:     TODO (some explanation)
" CREATED:  2026-10-29 09:50:00
" MODIFIED: 2026-10-29 09:50:00

" Note: sourced before plugins load; set g:claude_code_* globals in advance,
" the plugin reads them via get(g:, 'claude_code_<key>', default).
if exists("did_vim_claude_code_config")
    finish
endif
let did_vim_claude_code_config = 1

" claude command
let g:claude_code_command = 'claude'

" terminal window layout: 'right' | 'left' | 'top' | 'bottom' | 'float'
let g:claude_code_position = 'right'
let g:claude_code_split_ratio = 0.4

" focus the terminal and hide noise on open
let g:claude_code_enter_insert = 1
let g:claude_code_hide_numbers = 1
let g:claude_code_hide_signcolumn = 1

" run claude at the git root of the current file
let g:claude_code_use_git_root = 1
" allow more than one claude terminal
let g:claude_code_multi_instance = 1

" output refresh
let g:claude_code_refresh_enable = 1
let g:claude_code_refresh_interval = 1000

" default keymaps (toggle: <C-\>, zoom: <C-w>z)
let g:claude_code_map_keys = 1
" extended keymaps with prefix (<Leader>c -> ';c', mapleader is ';')
let g:claude_code_map_extended_keys = 1
let g:claude_code_map_extended_prefix = '<Leader>c'

" debug
let g:claude_code_debug = 0
