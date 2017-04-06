" Vim File
" AUTHOR:   ci
" FILE:     code_complete.vim
" ROLE:     TODO (some explanation)
" CREATED:  2017-03-31 23:27:24
" MODIFIED: 2017-04-06 20:27:49

if exists("g:did_code_complete_config")
    if g:did_code_complete_config == 2
        finish
    endif
else
    let g:did_code_complete_config = 0
endif

" before
if g:did_code_complete_config == 0
    let g:did_code_complete_config = 1
endif

" last
if exists("g:configure_last")
    let g:did_code_complete_config = 2

    let g:template['c']['ife0'] = "if (".g:rs."...".g:re.")\<cr>{\<cr>".g:rs."...".g:re."\<cr>} else\<cr>{\<cr>".g:rs."...".g:re."\<cr>}"
"
endif

