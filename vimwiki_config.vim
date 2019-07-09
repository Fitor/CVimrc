" Vim File
" AUTHOR:   ci
" FILE:     vimwiki_config.vim
" ROLE:     TODO (some explanation)
" CREATED:  2017-03-31 23:27:24
" MODIFIED: 2019-07-09 13:25:12

if exists("did_vimwiki_config")
    finish
endif
let did_vimwiki_config = 1

let g:vimwiki_list = [{'path': '~/.vimwiki/',
            \ 'path_html': '~/.vimwiki_html/'}]
