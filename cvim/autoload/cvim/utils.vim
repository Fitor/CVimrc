let s:cwd = getcwd()
if has('win32') || has('win64')
    let s:lash = '\'
el
    let s:lash = '/'
en

fu! s:glbpath(...)
	retu call('globpath', a:000)
endf

if exists('*fnameescape')
	if has('win32') || has('win64')
		fu! s:fnesc(path, type, ...)
			if a:type == 'c'
				let path = escape(a:path, '%#')
			elsei a:type == 'f'
				let path = fnameescape(a:path)
			elsei a:type == 'g'
				let path = escape(a:path, '?*')
			en
			let path = substitute(path, '[', '[[]', 'g')
			retu a:0 ? escape(path, a:1) : path
		endf
	el
		fu! s:fnesc(path, type, ...)
			let path = fnameescape(a:path)
			retu a:0 ? escape(path, a:1) : path
		endf
	en
el
	if has('win32') || has('win64')
		fu! s:fnesc(path, type, ...)
			if a:type == 'c'
				let path = escape(a:path, '%#')
			elsei a:type == 'f'
				let path = escape(a:path, " \t\n%#*?|<\"")
			elsei a:type == 'g'
				let path = escape(a:path, '?*')
			en
			let path = substitute(path, '[', '[[]', 'g')
			retu a:0 ? escape(path, a:1) : path
		endf
	el
		fu! s:fnesc(path, type, ...)
			let path = escape(a:path, " \t\n*?[{`$\\%#'\"|!<")
			retu a:0 ? escape(path, a:1) : path
		endf
	en
en

fu! s:getparent(item)
	let parent = substitute(a:item, '[\/][^\/]\+[\/:]\?$', '', '')
	if parent == '' || parent !~ '[\/]'
		let parent .= s:lash
	en
	retu parent
endf

fu! s:findroot(curr, mark, maxdepth)
	let [maxdepth, fnd] = [a:maxdepth - 1, 0]
	if type(a:mark) == v:t_string
		let fnd = s:glbpath(s:fnesc(a:curr, 'g', ','), a:mark, 1) != ''
	elsei type(a:mark) == v:t_list
		for markr in a:mark
			if s:glbpath(s:fnesc(a:curr, 'g', ','), markr, 1) != ''
				let fnd = 1
				brea
			en
		endfo
	en
	if fnd
		retu [exists('markr') ? markr : a:mark, a:curr]
	elsei maxdepth < 0
        retu
	el
		let parent = s:getparent(a:curr)
		if parent != a:curr
			retu s:findroot(parent, a:mark, maxdepth)
		en
	en
	retu []
endf

" usage:
" let markers = ['.git', '.hg', '.svn', '.bzr', '_darcs']
" call cvim#utils#findroot(s:cwd, markers, 40)
fu! cvim#utils#findroot(curr, mark, maxdepth)
    return s:findroot(a:curr, a:mark, a:maxdepth)
endf

" pattern transform
fu! s:checkChar(c)
    for c in [ '(', ')', '{', '}', '|', '+', '?']
        if a:c == c
            return v:true
        en
    endfor

    return v:false
endf

fu! s:magicPattern2Perl(s)
    let i = 0
    let l = strlen(a:s)
    let a = []
    while i < l:l
        let c = a:s[i]
        if s:checkChar(c) == v:true
            call add(a, '\' . c)
        elseif c == '\'
            let i += 1
            if i >= l
                return
            en
            let c = a:s[i]
            if s:checkChar(c) == v:true
                call add(a, c)
            else
                call add(a, '\' . c)
            en
        else
            call add(a, c)
        en

        let i += 1
    endwhile

    return join(a, '')
endf

fu! cvim#utils#magicPattern2Perl(str)
    return s:magicPattern2Perl(a:str)
endf
