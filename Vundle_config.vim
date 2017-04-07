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
Plugin 'header.vim'
Plugin 'dbext.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'itchyny/lightline.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'godlygeek/tabular'
" Plugin 'Lokaltog/vim-powerline'
Plugin 'mbbill/code_complete'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'ctrlpvim/ctrlp.vim'

Plugin 'itchyny/calendar.vim' " A calendar application for Vim

let &cpo = s:save_cpo
unlet s:save_cpo

