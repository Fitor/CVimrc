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
Plugin 'dbext.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'itchyny/lightline.vim'
if has('python')
Plugin 'Valloric/YouCompleteMe'
Plugin 'tdcdev/ycm_simple_conf' " YouCompleteMe Simple Configuration
endif
Plugin 'godlygeek/tabular'
" Plugin 'Lokaltog/vim-powerline'
Plugin 'mbbill/code_complete'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'tacahiroy/ctrlp-funky'
Plugin 'a.vim' "Alternate Files quickly.(.c --> .h etc)
Plugin 'mycomment' " quickly toggle comment without thingking
Plugin 'itchyny/calendar.vim' " A calendar application for Vim
Plugin 'tpope/vim-fugitive' " A Git wrapper so awesome.
Plugin 'junegunn/goyo.vim' " Distraction-free writing in Vim.
Plugin 'easymotion/vim-easymotion' " Vim motions on speed!
Plugin 'vimwiki/vimwiki' " Personal Wiki for Vim
Plugin 'kana/vim-textobj-user' " Create your own text objects
Plugin 'kana/vim-textobj-function' " Text objects for functions
Plugin 'argtextobj.vim' " Text-object like motion for arguments
Plugin 'terryma/vim-multiple-cursors' " True Sublime Text style multiple selections for Vim
Plugin 'tpope/vim-surround' " quoting/parenthesizing made simple

let &cpo = s:save_cpo
unlet s:save_cpo

