" Vim File
" AUTHOR:   kimson
" FILE:     ci_configure_last.vim
" ROLE:     TODO (some explanation)
" CREATED:  2017-04-06 19:23:40
" MODIFIED: 2018-01-26 14:53:45

if exists("g:did_ci_configure_last")
    finish
endif
let g:did_ci_configure_last = 1

" load configure files
for b in bundles
    if b.name == "Vundle.vim"
        continue
    endif

    let f = $HOME . "/.vim/CVimrc/" . substitute(b.name, ".vim", "", "") . "_config.vim"
    if 0 != filereadable(f)
        execute "source " . f
    endif
endfor
