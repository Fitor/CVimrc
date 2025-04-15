if exists("g:did_startify_config")
    finish
endif
let g:did_startify_config = 1

let g:startify_lists = [
            \ { 'type': 'sessions',  'header': ['   Sessions']       },
            \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
            \ { 'type': 'files',     'header': ['   MRU']            },
            \ { 'type': 'dir',       'header': ['   MRU '. getcwd()] },
            \ { 'type': 'commands',  'header': ['   Commands']       },
            \ ]
if exists('g:cvimroot')
    let g:startify_session_dir = g:cvimroot.'/.cvim/session'
endif

function! s:read_bookmarks()
    if exists('g:startify_bookmark_loading')
        return
    endif
    let g:startify_bookmark_loading = 1

    let g:startify_bookmarks = []
    if filereadable(g:NERDTreeBookmarksFile)
        let g:NERDTreeInvalidBookmarks = []
        let bookmarkStrings = readfile(g:NERDTreeBookmarksFile)
        for i in bookmarkStrings

            "ignore blank lines
            if i !=# ''

                let name = substitute(i, '^\(.\{-}\) .*$', '\1', '')
                let path = substitute(i, '^.\{-} \(.*\)$', '\1', '')
                let path = fnamemodify(path, ':p')

                let bookmark = { name: path }

                call add(g:startify_bookmarks, bookmark)
            endif
        endfor
    endif

    exec 'Startify'

    unlet g:startify_bookmark_loading
endfunction

autocmd User StartifyReady call s:read_bookmarks()

" session
let g:startify_session_savevars = [
            \ 'g:startify_tabs_name',
            \ ]
let g:startify_session_before_save = [
            \ 'silent! tabdo NERDTreeClose',
            \ 'silent! call cvim#save_tabs_name()',
            \ ]
let g:startify_session_savecmds = [
            \ 'call cvim#load_tabs_name()',
            \ ]
