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

Plugin 'mhinz/vim-startify' " The fancy start screen for vim.
Plugin 'scrooloose/nerdtree'
Plugin 'itchyny/lightline.vim' "A light and configurable statusline/tabline plugin for Vim
Plugin 'godlygeek/tabular'
Plugin 'Fitor/tabman.vim'  " Tab management for Vim
Plugin 'a.vim' "Alternate Files quickly.(.c --> .h etc)
Plugin 'DoxygenToolkit.vim'
Plugin 'preservim/nerdcommenter' " Commnet functions so powerful-no comment necessary.
Plugin 'tpope/vim-fugitive' " A Git wrapper so awesome.
Plugin 'junegunn/goyo.vim' " Distraction-free writing in Vim.
Plugin 'easymotion/vim-easymotion' " Vim motions on speed!
Plugin 'tpope/vim-surround' " quoting/parenthesizing made simple
Plugin 'mbriggs/mark.vim' " Hightlight serveral words in different simultaneously.
Plugin 'vimwiki/vimwiki' " Personal Wiki for Vim

if exists('g:cv_calendar_enable') && g:cv_calendar_enable == v:true
    Plugin 'mattn/calendar-vim' " calendar.vim creates a calenar window you cam use within vim.
endif

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
Plugin 'jeffkreeftmeijer/vim-numbertoggle' " Toggles between hybrid and absolute line numbers automatically
if exists('g:cv_drawit_enable') && g:cv_drawit_enable == v:true
    Plugin 'DrawIt' "Ascii drawing plugin: lines, ellipses, arrows, fills, and more!
endif
Plugin 'Raimondi/delimitMate' " Provides insert mode auto-completin for quotes, parens, brackets, etc.
if exists('g:cv_ale_enable') && g:cv_ale_enable == v:true
    Plugin 'dense-analysis/ale' " Asynchronous Lint Engine
endif
if exists('g:cv_clang_format_enable') && g:cv_clang_format_enable == v:true
    if executable('clang-format')
        Plugin 'rhysd/vim-clang-format' " This plugin formats your code with specific coding style using clang-format.
    else
        echom 'command not found: clang-format'
    endif
endif

if exists('g:cv_ctrlp_enable') && g:cv_ctrlp_enable == v:true
    Plugin 'ctrlpvim/ctrlp.vim'
    Plugin 'tacahiroy/ctrlp-funky'
endif

if exists('g:cv_fzf_enable') && g:cv_fzf_enable == v:true
    Plugin 'junegunn/fzf' " Things you can do with fzf and Vim.
    Plugin 'junegunn/fzf.vim'
endif
Plugin 'embear/vim-localvimrc'

" code plugin
Plugin 'pangloss/vim-javascript'
Plugin 'othree/html5.vim'
Plugin 'posva/vim-vue' " vim syntax highlighting for Vue components'
Plugin 'fatih/vim-go' " Go development plugin
if exists('g:cv_code_wxapp_enable') && g:cv_code_wxapp_enable == v:true
    Plugin 'chemzqm/wxapp.vim' " For wx miniprogram
endif

" ai assistant
if exists('g:cv_ai_assistant_enable') && g:cv_ai_assistant_enable == v:true
    if exists('g:cv_ai_assistant_plugin') == v:false
        let g:cv_ai_assistant_plugin = 'codeium'
    endif

    if g:cv_ai_assistant_plugin == 'codeium'
        Plugin 'Exafunction/codeium.vim' " Free, ultrafast Copilot alternative for Vim and Neovim
    elseif g:cv_ai_assistant_plugin == 'vim-ollama'
        Plugin 'gergap/vim-ollama' " This plugin adds Copilot-like code completion support to Vim.
    elseif g:cv_ai_assistant_plugin == 'vim-ai'
        Plugin 'madox2/vim-ai' " This plugin adds Artificial Intelligence (AI) capabilities to your Vim and Neovim.
    endif
endif

let &cpo = s:save_cpo
unlet s:save_cpo

