if exists('g:loaded_cvim') && g:loaded_cvim
    fini
en
let g:loaded_cvim = 1

" init/new/edit
fu! cvim#init()
    if filereadable(g:vimhome . '/cvimrc.vim')
        exec 'source ' . fnameescape(g:vimhome . '/cvimrc.vim')
    endif

    let s:rootpath = cvim#utils#findroot(getcwd(), '.cvim', 40)
    if type(s:rootpath) != v:t_list || empty(s:rootpath)
        retu
    en

    let root = s:rootpath[1]

    if !isdirectory(root . '/.cvim')
        echom 'CVimrc: Path [' . root . '/.cvim] not a directory. Please remove it first and run :CVNew.'
        retu
    en

    let g:cvimroot = root

    if filereadable(g:cvimroot . '/.cvim/cvimrc.vim')
        exec 'source ' . g:cvimroot . '/.cvim/cvimrc.vim'
    en
endf

fu! s:edit_global_cvimrc()
    if filereadable(g:vimhome . '/cvimrc.vim')
        exec 'new ' . g:vimhome . '/cvimrc.vim'
    else
        let confirm = input('Config file [' . g:vimhome . "/cvimrc.vim] not found.\n"
                    \ . 'Would you like to create new one? (y/n):') ==? 'y'
        if !confirm
            retu
        en
        call filecopy(g:cvimrc . '/templates/cvimrc.vim', g:vimhome . '/cvimrc.vim')
        exec 'new ' . g:vimhome . '/cvimrc.vim'
    en
endf

fu! s:edit_local(f)
    if !exists('g:cvimroot')
        echom 'Cvim root .cvim not found. Please run :CVNew first.'
        retu
    en

    if filereadable(g:cvimroot.'/.cvim/'.a:f)
        exec 'new '.g:cvimroot.'/.cvim/'.a:f
    else
        let confirm = input('Config file ['.g:cvimroot.'/.cvim/'.a:f."] not found.\n"
                    \.'Would you like to create new one? (y/n):') ==? 'y'
        if !confirm
            retu
        en
        call filecopy(g:cvimrc.'/templates/'.a:f, g:cvimroot.'/.cvim/'.a:f)
        exec 'new '.g:cvimroot.'/.cvim/'.a:f
    en
endf

fu! s:open_template(f)
    exec 'new +setlocal\ nomodifiable|setlocal\ readonly '
                \.g:cvimrc.'/templates/'.a:f
endf

fu! cvim#Edit(...)
    for c in a:000
        if c == 'global'
            call s:edit_global_cvimrc()
        elseif c == 'local'
            call s:edit_local('cvimrc.vim')
        elseif c == 'cvimrc-template'
            call s:open_template('cvimrc.vim')
        elseif c == 'rg'
            call s:edit_local('rgconf')
        elseif c == 'rgconf-template'
            call s:open_template('rgconf')
        else
            echom 'Unkown type [' . c . ']...'
            retu
        en
    endfor

    if a:0
        return
    en

    call s:edit_local('cvimrc.vim')
endf

fu! cvim#New()
    let cwd = getcwd()

    if exists('g:cvimroot')
        echom 'CVimRoot [' . g:cvimroot . '] already exists.'
        retu
    en

    if isdirectory(cwd . '/.cvim')
        let g:cvimroot = cwd
        echom 'CVimRoot [' . g:cvimroot . '] already exists.'
        retu
    en

    if filereadable(cwd . '/.cvim')
        echom 'Path [' . cwd . '/.cvim] not a directory. Please remove it first.'
        retu
    en

    let g:cvimroot = cwd
    call mkdir(g:cvimroot . '/.cvim')
    call filecopy(g:cvimrc . '/templates/rgconf', g:cvimroot . '/.cvim/rgconf')
    call filecopy(g:cvimrc . '/templates/cvimrc.vim', g:cvimroot . '/.cvim/cvimrc.vim')
    exec 'new ' . g:cvimroot . '/.cvim/rgconf'
    exec 'vsplit ' . g:cvimroot . '/.cvim/cvimrc.vim'
endf

" cwd
fu! cvim#fcd()
    if exists('g:cvimroot')
        let dir = g:cvimroot
    else
        let dir = getcwd()
    en
    call fzf#vim#files(dir, fzf#vim#with_preview({'options': ['--layout=reverse', '--info=inline', '--walker=dir,follow,hidden'], 'sink': 'tcd'}))
endf

fu! cvim#Cd()
    if exists('g:cvimroot')
        exec 'cd ' . g:cvimroot
    en
endf

fu! cvim#Tcd()
    if exists('g:cvimroot')
        exec 'cd ' . g:cvimroot
    en
endf

fu! cvim#Lcd()
    exec 'tcd ' . getcwd(-1, 0)
endf

fu! cvim#update_win_cwd()
    if exists('w:unfollow_tab_cwd')
        return
    endif

    if exists('w:fzf_pushd')
        return
    endif

    if getcwd() !=# getcwd(-1, 0)
        exec 'lcd ' . fnameescape(getcwd(-1, 0))
        doautocmd DirChanged
    endif
endf

" files
fu! cvim#files()
    let cwd = getcwd()
    if exists('g:cvimroot')
        let dir = g:cvimroot
    else
        let dir = cwd
    en
    call fzf#vim#files(dir, fzf#vim#with_preview({
                \ 'options': ['--layout=reverse', '--info=inline'],
                \ 'sink': 'e +lcd\ ' . fnameescape(cwd)}))
endf

fu! cvim#curfiles()
    let dir = getcwd()
    call fzf#vim#files(dir, fzf#vim#with_preview({'options': ['--layout=reverse', '--info=inline']}))
endf

" grep
fu! cvim#grep()
    let magic_pattern = getreg('/')
    let pattern = input('grep> Input pattern('.magic_pattern.'):')

    if strlen(pattern) <= 0
        let pattern = magic_pattern
    else
        let magic_pattern = pattern
    en

    let pattern = cvim#utils#pattern_magic2perl(pattern)

    let rg_opts = [
                \ '--column',
                \ '--line-number',
                \ '--no-heading',
                \ '--with-filename',
                \ '--color=always',
                \ '--pcre2',
                \ '--'
                \ ]
    let fzf_opts = [
                    \ '--header='.magic_pattern.' -> '.pattern,
                    \ '--layout=reverse',
                    \ '--info=inline',
                    \ '--multi', '--bind', 'ctrl-a:select-all,ctrl-d:deselect-all',
                    \ '--scheme', 'path',
                    \ '-m',
                    \ ]

    let path = input('grep> Input path:')

    if exists('g:cvimroot')
        let path = g:cvimroot.'/'.path
    else
        let path = getcwd().'/'.path
    en

    let prettypath = cvim#utils#relpath(path).' -> '.cvim#prettypath(path)
    let fzf_opts += [ '--prompt', strwidth(prettypath) < &columns / 2 - 20 ? 'Rg> ' . prettypath : 'Rg> ' ]

    if exists('g:cvimroot')
        let rgconf = g:cvimroot.'/.cvim/rgconf'
        call fzf#vim#grep('( env RIPGREP_CONFIG_PATH='.shellescape(rgconf)
                    \ .' rg '.join(rg_opts, ' ').' '.shellescape(pattern).' '.escape(cvim#utils#relpath(path), ' ').')',
                    \ fzf#vim#with_preview({'options': fzf_opts }))
    else
        call fzf#vim#grep('rg '.join(rg_opts, ' ').' '.shellescape(pattern).' '.escape(cvim#utils#relpath(path), ' '),
                    \ fzf#vim#with_preview({'options': fzf_opts}))
    en
endf

fu! cvim#curgrep()
    let magic_pattern = getreg('/')
    let pattern = input('curgrep> Input pattern('.magic_pattern.'):')

    if strlen(pattern) <= 0
        let pattern = magic_pattern
    else
        let magic_pattern = pattern
    en

    let pattern = cvim#utils#pattern_magic2perl(pattern)

    let path = input('curgrep> Input path:')
    let path = getcwd().'/'.path
    let prettypath = cvim#utils#relpath(path).' -> '.cvim#prettypath(path)

    let rg_opts = [
                \ '--column',
                \ '--line-number',
                \ '--no-heading',
                \ '--with-filename',
                \ '--color=always',
                \ '--pcre2',
                \ '--'
                \ ]
    let fzf_opts = [
                    \ '--header='.magic_pattern.' -> '.pattern,
                    \ '--layout=reverse',
                    \ '--info=inline',
                    \ '--multi', '--bind', 'ctrl-a:select-all,ctrl-d:deselect-all',
                    \ '--scheme', 'path',
                    \ '-m',
                    \ '--prompt', strwidth(prettypath) < &columns / 2 - 20 ? 'Rg> ' . prettypath : 'Rg> ',
                    \ ]

    if exists('g:cvimroot')
        let rgconf = g:cvimroot.'/.cvim/rgconf'
        call fzf#vim#grep('( env RIPGREP_CONFIG_PATH='.shellescape(rgconf)
                    \ .' rg '.join(rg_opts, ' ').' '.shellescape(pattern).' '.escape(cvim#utils#relpath(path), ' ').')',
                    \ fzf#vim#with_preview({'options': fzf_opts }))
    else
        call fzf#vim#grep("rg ".join(rg_opts, ' ').' '.shellescape(pattern).' '.escape(cvim#utils#relpath(path), ' '),
                    \ fzf#vim#with_preview({'options': fzf_opts}))
    en
endf

" pretty path
fu! cvim#prettypath(path)
    if !exists('g:cv_pretty_path')
        return a:path
    en

    let ml = 0

    for [k, v] in items(g:cv_pretty_path)
        let p = substitute(a:path, k, v, '')
        if p == a:path
            continue
        en

        let l = len(k)
        if l > ml
            let ml = l
            let r = p
        en
    endfor

    return exists('r') ? r : a:path
endf

" session
fu! cvim#save_tabs_name()
    let tabnameStrings = []
    for nr in range(1, tabpagenr('$'))
        let name = gettabvar(nr, 'cvname')
        if empty(name)
            continue
        endif
        call add(tabnameStrings, nr.' '.name)
    endfor

    let session_tabs_file = fnamemodify(v:this_session, ':h')
    let session_tabs_file = session_tabs_file.'/.'.fnamemodify(v:this_session, ":t").'_tabname'

    try
        call writefile(tabnameStrings, session_tabs_file)
    catch
        echohl errormsg
        echom 'Failed to write tab name file'.cvim#utils#relpath(session_tabs_file).'.'
        echohl normal
    endtry
endf

fu! cvim#load_tabs_name()
    let session_tabs_file = fnamemodify(v:this_session, ':h')
    let session_tabs_file = session_tabs_file.'/.'.fnamemodify(v:this_session, ":t").'_tabname'

    if !filereadable(session_tabs_file)
        return
    endif

    let bookmarkStrings = readfile(session_tabs_file)
    for i in bookmarkStrings
        if i ==# ''
            continue
        endif

        let nr = substitute(i, '^\(.\{-}\) .*$', '\1', '')
        let name = substitute(i, '^.\{-} \(.*\)$', '\1', '')
        call settabvar(nr, 'cvname', name)
    endfor
endf

" terminal quick shell command
fu! s:term_quickcmds()
    if exists('g:cvim_term_quickcmds')
        return g:cvim_term_quickcmds
    endif
    return []
endf

fu! cvim#term_quickcmd()
    let cmds = s:term_quickcmds()
    if 0 == len(cmds)
        return ''
    endif

    let r = fzf#run({'source': cmds})
    if 0 == len(r)
        return ''
    endif
    return r[0]
endf

fu! s:term_quickcmd_sink(c)
    call term_sendkeys(bufnr(''), a:c)
endf

fu! s:term_quickcmd_exit(c)
    " call win_execute(bufwinid(bufnr('')), 'normal! a')
    call feedkeys('i', 'x')
endf

fu! cvim#term_quickcmd2()
    let cmds = s:term_quickcmds()
    if 0 == len(cmds)
        return ''
    endif

    call fzf#run({'source': cmds,
                \ 'sink': function('s:term_quickcmd_sink'),
                \ 'exit': function('s:term_quickcmd_exit'),
                \ 'window': { 'width': 0.9, 'height': 0.6 }})

    return ''
endf
