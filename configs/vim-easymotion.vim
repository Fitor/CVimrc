" Vim File
" AUTHOR:   ci
" FILE:     vim-easymotion_config.vim
" ROLE:     TODO (some explanation)
" CREATED:  2017-03-31 23:27:24
" MODIFIED: 2017-07-05 23:18:13

if exists("did_easy_motion_config")
    finish
endif
let did_easy_motion_config = 1

let g:EasyMotion_smartcase = 1
let g:EasyMotion_startofline = 0 " keep cursor colum when JK motion
