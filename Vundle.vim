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

" The fancy start screen for vim.
Plugin 'mhinz/vim-startify'
" A tree explorer plugin to rule the Vim world.
Plugin 'scrooloose/nerdtree'
"A light and configurable statusline/tabline plugin for Vim
Plugin 'itchyny/lightline.vim'
" Configurable, flexible, intuitive text aligning
Plugin 'godlygeek/tabular'
" Tab management for Vim
Plugin 'Fitor/tabman.vim'
"Alternate Files quickly.(.c --> .h etc)
Plugin 'a.vim'
" Generates a doxygen comment skeleton
Plugin 'DoxygenToolkit.vim'
" Commnet functions so powerful-no comment necessary.
Plugin 'preservim/nerdcommenter'
" A Git wrapper so awesome.
Plugin 'tpope/vim-fugitive'
" Distraction-free writing in Vim.
Plugin 'junegunn/goyo.vim'
" Vim motions on speed!
Plugin 'easymotion/vim-easymotion'
" quoting/parenthesizing made simple
Plugin 'tpope/vim-surround'
" Hightlight serveral words in different simultaneously.
Plugin 'mbriggs/mark.vim'
" Personal Wiki for Vim
Plugin 'vimwiki/vimwiki'

" calendar.vim creates a calenar window you cam use within vim.
if exists('g:cv_calendar_enable') && g:cv_calendar_enable == v:true
    Plugin 'mattn/calendar-vim'
endif

" Source code browser
if executable('exuberant-ctags') || executable('exctags') || executable('ctags') || executable('ctags.exe') || executable('tags')
    Plugin 'vim-scripts/taglist.vim'
endif
if has("python3") || has("python")
    " The Ultimate Plugin for Snippets in Vim~
    Plugin 'SirVer/ultisnips'
else
    Plugin 'tomtom/tlib_vim'
    Plugin 'MarcWeber/vim-addon-mw-utils'
    " snipMate.vim aims to be a concise vim script that implements some TextMate's snippets features in Vim.
    Plugin 'garbas/vim-snipmate'
endif
" This plugin contains snippets files for various programming languages.
Plugin 'honza/vim-snippets'
" Toggles between hybrid and absolute line numbers automatically
Plugin 'jeffkreeftmeijer/vim-numbertoggle'
if exists('g:cv_drawit_enable') && g:cv_drawit_enable == v:true
    "Ascii drawing plugin: lines, ellipses, arrows, fills, and more!
    Plugin 'DrawIt'
endif
" Provides insert mode auto-completin for quotes, parens, brackets, etc.
Plugin 'Raimondi/delimitMate'
if exists('g:cv_ale_enable') && g:cv_ale_enable == v:true
    " Asynchronous Lint Engine
    Plugin 'dense-analysis/ale'
endif
if exists('g:cv_clang_format_enable') && g:cv_clang_format_enable == v:true
    if executable('clang-format')
        " This plugin formats your code with specific coding style using clang-format.
        Plugin 'rhysd/vim-clang-format'
    else
        echom 'command not found: clang-format'
    endif
endif

if exists('g:cv_ctrlp_enable') && g:cv_ctrlp_enable == v:true
    Plugin 'ctrlpvim/ctrlp.vim'
    Plugin 'tacahiroy/ctrlp-funky'
endif

if exists('g:cv_fzf_enable') && g:cv_fzf_enable == v:true
    " Things you can do with fzf and Vim.
    Plugin 'junegunn/fzf'
    Plugin 'junegunn/fzf.vim'
endif

" code plugin
Plugin 'pangloss/vim-javascript'
Plugin 'othree/html5.vim'
" vim syntax highlighting for Vue components'
Plugin 'posva/vim-vue'
" Go development plugin
Plugin 'fatih/vim-go'
if exists('g:cv_code_wxapp_enable') && g:cv_code_wxapp_enable == v:true
    " For wx miniprogram
    Plugin 'chemzqm/wxapp.vim'
endif

" ai assistant
if exists('g:cv_ai_assistant_enable') && g:cv_ai_assistant_enable == v:true
    if exists('g:cv_ai_assistant_plugin') == v:false
        let g:cv_ai_assistant_plugin = 'codeium'
    endif

    if g:cv_ai_assistant_plugin == 'codeium'
        " Free, ultrafast Copilot alternative for Vim and Neovim
        Plugin 'Exafunction/codeium.vim'
    elseif g:cv_ai_assistant_plugin == 'vim-ollama'
        " This plugin adds Copilot-like code completion support to Vim.
        Plugin 'gergap/vim-ollama'
    elseif g:cv_ai_assistant_plugin == 'vim-ai'
        " This plugin adds Artificial Intelligence (AI) capabilities to your Vim and Neovim.
        Plugin 'madox2/vim-ai'
    endif
endif

let &cpo = s:save_cpo
unlet s:save_cpo

