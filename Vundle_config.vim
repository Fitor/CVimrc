" Vundle_config.vim
"
" Configure for Vundle
" Create Time: Fri, 24 Mar 2017 01:52:56 +0800
" Maintainer: Ci Chen <chen2033@live.com>
" License:

if exists("g:did_vundle_config")
    finish
endif
let g:did_vundle_config = 1

let s:save_cpo = &cpo
 set cpo&vim

Plugin 'DoxygenToolkit.vim'
Plugin 'Fitor/header.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'itchyny/lightline.vim'
Plugin 'godlygeek/tabular'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'tacahiroy/ctrlp-funky'
Plugin 'a.vim' "Alternate Files quickly.(.c --> .h etc)
Plugin 'mycomment' " quickly toggle comment without thingking
Plugin 'tpope/vim-fugitive' " A Git wrapper so awesome.
Plugin 'junegunn/goyo.vim' " Distraction-free writing in Vim.
Plugin 'easymotion/vim-easymotion' " Vim motions on speed!
Plugin 'vimwiki/vimwiki' " Personal Wiki for Vim
Plugin 'tpope/vim-surround' " quoting/parenthesizing made simple
Plugin 'mbriggs/mark.vim' " Hightlight serveral words in different simultaneously.
Plugin 'kien/tabman.vim'  " Tab management for Vim
if executable('exuberant-ctags') || executable('exctags') || executable('ctags') || executable('ctags.exe') || executable('tags')
    Plugin 'vim-scripts/taglist.vim' " Source code browser
endif
if has("python3") || has("python")
    Plugin 'SirVer/ultisnips'
else
    Plugin 'tomtom/tlib_vim'
    Plugin 'MarcWeber/vim-addon-mw-utils'
    Plugin 'garbas/vim-snipmate' " snipMate.vim aims to be a concise vim script that implements some TextMate's snippets features in Vim.
endif
Plugin 'honza/vim-snippets'
Plugin 'mhinz/vim-startify' " The fancy start screen for vim.
Plugin 'jeffkreeftmeijer/vim-numbertoggle' " Toggles between hybrid and absolute line numbers automatically
Plugin 'posva/vim-vue' " vim syntax highlighting for Vue components'
Plugin 'DrawIt' "Ascii drawing plugin: lines, ellipses, arrows, fills, and more!

let &cpo = s:save_cpo
unlet s:save_cpo

