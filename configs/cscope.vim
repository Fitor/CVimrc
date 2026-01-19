" Vim File
" AUTHOR:   ci
" FILE:     cscope_config.vim
" ROLE:     TODO (some explanation)
" CREATED:  2018-01-02 18:19:25
" MODIFIED: 2018-01-02 18:37:00

if exists("did_cscope_config")
    finish
endif
let did_cscope_config = 1

if has("cscope")
    set csprg=cscope
    set csto=1
    set cst
    set nocsverb
    " add any database in current directory
    if filereadable("cscope.out")
        cs add cscope.out
    endif
    set csverb
endif
