" path
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
" Reference from ctrlp
fu! cvim#utils#findroot(curr, mark, maxdepth)
    return s:findroot(a:curr, a:mark, a:maxdepth)
endf

fu! s:relpath(target, ...)
    " convert to absolute path
    let base = fnamemodify(a:0 ? simplify(a:1) : getcwd(), ':p')
    let target = fnamemodify(simplify(a:target), ':p')

    " splic
    let base_parts = split(base, '/', 1)
    let target_parts = split(target, '/', 1)

    " remove last empty part
    if !empty(base_parts) && base_parts[-1] ==# ''
        call remove(base_parts, -1)
    en
    if !empty(target_parts) && target_parts[-1] ==# ''
        call remove(target_parts, -1)
    en

    " find common prefix
    let i = 0
    while i < len(base_parts) && i < len(target_parts)
        if base_parts[i] !=# target_parts[i]
            break
        en

        let i += 1
    endwhile

    " calculate the backoff derivative and the remaining portion of the target
    let back_parts = repeat(['..'], len(base_parts) - i)
    let target_remain = target_parts[i:]

    " form a relative path
    let rel_parts = back_parts + target_remain
    let rel_path = join(rel_parts, '/')

    return rel_path !=# '' ? rel_path : '.'
endf

fu! cvim#utils#relpath(target, ...)
    return call('s:relpath', [ a:target ] + a:000)
endf

" pattern
fu! s:reverse_char(c)
    for c in [ '(', ')', '{', '}', '|', '+', '?' ]
        if a:c ==# c
            return v:true
        en
    endfor

    return v:false
endf

fu! s:translate_magic(c)
    for [k, v] in items({
                \ '<': 'b',
                \ '>': 'b',
                \})
        if a:c ==# k
            return v
        en
    endfor

    return a:c
endf

fu! s:pattern_magic2perl(s)
    let i = 0
    let l = strlen(a:s)
    let caseignore = v:true
    let a = [ ]
    while i < l:l
        let c = a:s[i]
        if s:reverse_char(c) == v:true
            call add(a, '\' . c)
        elseif c == '\'
            let i += 1
            if i >= l
                return
            en
            let c = a:s[i]
            if c ==# 'c'
                let caseignore = v:true
            elseif c ==# 'C'
                let caseignore = v:false
            elseif s:reverse_char(c) == v:true
                call add(a, c)
            else
                call add(a, '\' . s:translate_magic(c))
            en
        else
            call add(a, c)
        en

        let i += 1
    endwhile

    if caseignore == v:true
        let a = ['(?i)'] + a
    en

    return join(a, '')
endf

fu! cvim#utils#pattern_magic2perl(str)
    return s:pattern_magic2perl(a:str)
endf
