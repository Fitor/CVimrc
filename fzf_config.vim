" Vim File
if exists("g:did_fzf_config")
    finish
en
let g:did_fzf_config = 1

let g:fzf_layout = { 'window': 'bel 20new' }

let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Question'] }

let g:fzf_vim = {}

let g:fzf_vim.preview_window = ['hidden,right,50%,<70(hidden,up,40%)', 'ctrl-/']
let g:fzf_vim.listproc = { list -> fzf#vim#listproc#quickfix(list) }
