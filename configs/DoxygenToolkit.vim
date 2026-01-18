" Vim File
" AUTHOR:   ci
" FILE:     CVimrc/DoxygenToolkit_config.vim
" ROLE:     TODO (configure for DoxygenToolkit)
" CREATED:  2017-03-25 01:12:03
" MODIFIED: 2017-03-27 15:26:45

if exists("did_DoxygenToolkit_config")
    finish
endif
let did_DoxygenToolkit_config = 1

let g:load_doxygen_syntax=1
let g:DoxygenToolkit_commentType = "javadoc"
let g:DoxygenToolkit_compactOneLineDoc="yes"
