" Vim File
" AUTHOR:   ci
" FILE:     calendar_config.vim
" ROLE:     TODO (some explanation)
" CREATED:  2017-03-31 23:27:24
" MODIFIED: 2017-04-08 00:57:47

if exists("g:did_calendar_config")
    if g:did_calendar_config == 2
        finish
    endif
else
    let g:did_calendar_config = 0
endif

" before
if g:did_calendar_config == 0
    let g:did_calendar_config = 1
    let g:calendar_diary = $HOME . "/.vim/MyVinrc/diary"
endif

" last
if exists("g:configure_last")
    let g:did_calendar_config = 2
" ...
endif

