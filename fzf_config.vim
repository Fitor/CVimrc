" Vim File
if exists("g:did_fzf_config")
    if g:did_fzf_config == 2
        finish
    endif
else
    let g:did_fzf_config = 0
endif

" before
if g:did_fzf_config == 0
    let g:did_fzf_config = 1

    let g:fzf_vim = {}
    let g:fzf_vim.listproc = { list -> fzf#vim#listproc#quickfix(list) }
endif

" last
if exists("g:configure_last")
    let g:did_fzf_config = 2
endif

