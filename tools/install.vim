set nocompatible
filetype off

let g:vimhome = expand($HOME . '/.vim')
let g:cvimrc = expand('<sfile>:p:h:h')

exec 'set rtp+=' . fnameescape(g:vimhome . '/bundle/Vundle.vim')
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
exec 'source ' . fnameescape(g:cvimrc . '/Vundle_config.vim')
call vundle#end()
