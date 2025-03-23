if exists('g:loaded_cvim') && g:loaded_cvim
    fini
en
let g:loaded_cvim = 1

fu! cvim#init()
    if filereadable(g:vimhome . '/cvimrc.vim')
        exec 'source ' . fnameescape(g:vimhome . '/cvimrc.vim')
    endif

    let s:rootpath = cvim#utils#findroot(getcwd(), '.cvim', 40)
    if type(s:rootpath) != v:t_list || empty(s:rootpath)
        retu
    en

    let l:root = s:rootpath[1]

    if !isdirectory(l:root . '/.cvim')
        echom 'CVimrc: Path [' . l:root . '/.cvim] not a directory. Please remove it first and run :CVNew.'
        retu
    en

    let g:cvimroot = l:root

    if filereadable(g:cvimroot . '/.cvim/cvimrc.vim')
        exec 'source ' . g:cvimroot . '/.cvim/cvimrc.vim'
    en
endf

fu! cvim#EditGlobal()
    if filereadable(g:vimhome . '/cvimrc.vim')
        exec 'new ' . g:vimhome . '/cvimrc.vim'
    else
        let confirm = input('Config file [' . g:vimhome . "/cvimrc.vim] not found.\n"
                    \ . 'Would you like to create new one? (y/n):') ==? 'y'
        if !confirm
            retu
        en
        call filecopy(g:cvimrc . '/cvimrc.vim', g:vimhome . '/cvimrc.vim')
        exec 'new ' . g:vimhome . '/cvimrc.vim'
    en
endf

fu! cvim#Edit()
    if !exists('g:cvimroot')
        echom 'Cvim root .cvim not found. Please run :CVNew first.'
        retu
    en

    if !isdirectory(g:cvimroot . '/.cvim')
        echom 'Path [' . g:cvimroot . '/.cvim] not a directory. Please remove it and run :CVNew.'
        retu
    en

    if filereadable(g:cvimroot . '/.cvim/cvimrc.vim')
        exec 'new ' . g:cvimroot . '/.cvim/cvimrc.vim'
    else
        let confirm = input('Config file [' . g:cvimroot . "/.cvim/cvimrc.vim] not found.\n"
                    \ . 'Would you like to create new one? (y/n):') ==? 'y'
        if !confirm
            retu
        en
        call filecopy(g:cvimrc . '/cvimrc.vim', g:cvimroot . '/.cvim/cvimrc.vim')
        exec 'new ' . g:cvimroot . '/.cvim/cvimrc.vim'
    en
endf

fu! cvim#New()
    let l:cwd = getcwd()

    if exists('g:cvimroot')
        echom 'CVimRoot [' . g:cvimroot . '] already exists.'
        retu
    en

    if isdirectory(l:cwd . '/.cvim')
        let g:cvimroot = l:cwd
        echom 'CVimRoot [' . g:cvimroot . '] already exists.'
        retu
    en

    if filereadable(l:cwd . '/.cvim')
        echom 'Path [' . l:cwd . '/.cvim] not a directory. Please remove it first.'
        retu
    en

    let g:cvimroot = l:cwd
    call mkdir(g:cvimroot . '/.cvim')
    call filecopy(g:cvimrc . '/cvimrc.vim', g:cvimroot . '/.cvim/cvimrc.vim')
    exec 'new ' . g:cvimroot . '/.cvim/cvimrc.vim'
endf
