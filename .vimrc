" Change mapleader
let mapleader = ";"
" Uncomment the following to enable the pathogen.vim
execute pathogen#infect()

" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
if has("syntax")
  syntax on
endif

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
set background=dark
color delek

" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
if has("autocmd")
  filetype plugin indent on
endif

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
set showcmd	        " Show (partial) command in status line.
set showmatch       " Show matching brackets.
set ignorecase	    " Do case insensitive matching
"set smartcase	    " Do smart case matching
"set incsearch	    " Incremental search
set autowrite	    " Automatically save before commands like :next and :make
"set hidden         " Hide buffers when they are abandoned
"set mouse=a        " Enable mouse usage (all modes)
set hls
set number
set numberwidth=5
set cursorline
autocmd InsertLeave * se nocul
autocmd InsertLeave * se cul
set foldenable
set foldmethod=manual
"set foldcolumn=4
set nocompatible   
nnoremap <space>  @=((foldclosed(line('.'))<0)?'zc':'zo')<CR>
nnoremap ;<space> @=((foldclosed(line('.'))<0)?'zfap':'')<CR>

"status line
set ruler
set cmdheight=1

" File Setting
setlocal noswapfile
set bufhidden=hide
set linespace=0
set scrolloff=3


" virsual setting
"set showtabline=2      " always show the tabline
set matchtime=1


" editor settings
set title
set laststatus=2
set showmatch
set confirm
set novisualbell
"map <F3> bi{<Esc>ea}<Esc>        " char -> {char}
":inoremap ( ()<Esc>i
":inoremap ) <c-r>=ClosePair(')')<CR>
":inoremap { {<CR>}<Esc>O<Tab>
":inoremap } <c-r>=ClosePair('}')<CR>
function! ClosePair(char)
    if getline('.')[col('.') - 1] == a:char
        return "\<Right>"
    else
        return a:char
    endif
endfunction
" get the root right to write
cmap w!! w !sudo tee > /dev/null %
" open Completion Navigation List
set wildmenu
set wildmode=full


" Highlight current line
au Winleave * set nocursorline nocursorcolumn
au WinEnter * set cursorline cursorcolumn

" Default Indentation
set autoindent
set smartindent
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
"set cindent

" Windows operation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Make
map <F5> :call CompileRunGcc()<CR>
func! CompileRunGcc()
    exec "w"
    if &filetype == 'c'
        exec "!g++ % -o %<"
        exec "! ./%<"
    elseif &filetype == 'cpp'
        exec "!g++ % -o %<"
        exec "! ./%<"
    elseif &filetype == 'sh'
        :!./%
    endif
endfunc
map <F7> :call Rungdb()<CR>
func! Rungdb()
    exec "w"
    exec "!gcc % -g -o %<"
    exec "!gdb ./%<"
endfunc

"                             <Plugin Manager>
"        -> NERDTree
autocmd vimenter * NERDTree
map <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
"        -> tagbar
nmap <F8> :TagbarToggle<CR>
let g:tagbar_width = 40
autocmd VimEnter * nested : call tagbar#autoopen(1)
" let g:tagbar_left = 1
let g:tabar_right = 1
" Power Line -------------------------------------------------------------->
set guifont=PowerlineSymbols\ for\ Powerline
set t_Co=256
let g:powerline_symbols = 'fancy'  " there is some trouble
"        -> Cscope
" <OPTIONS>
" Use the option to specify the path to cscope excutalbe, if it is not in PATH.
  let g:cscope_cmd = '/home/yc/.vim/bundle/cscope'
" Use this option to stop opening location list after searching
  let g:cscope_open_location = 0
" Use this option to disable cscope database auto update.
"  let g:cscope_auto_update = 0
" Then you can update your cscope databases manually by:
"  call CscopeUpdateDB()
" Use this option to toggle messages for database updated.
  let g:cscope_silent = 1
" Specify a number. If total files found for a directory exceeds it, then a
" separated cscope database will be created for modified/added files to avoid
 "long time for updating cscope database.
  let g:cscope_split_threshold = 9999
" Specify the extentions you want to include when building cscope database, the
" default extentions are listed in interested.txt.
  let g:cscope_interested_files = '\.c$\|\.cpp$\|\.h$\|\.hpp'
" Preload path settings help you to load some common libraries by default. For example,
"    let g:cscope_preload_path="/usr/include/c++/;/works/phplib/trunk/php
nnoremap <leader>fa :call CscopeFindInteractive(expand('<cword>'))<CR>
nnoremap <leader>l :call ToggleLocationList()<CR>
" s: Find this C symbol
nnoremap  <leader>fs :call CscopeFind('s', expand('<cword>'))<CR>
" g: Find this definition
nnoremap  <leader>fg :call CscopeFind('g', expand('<cword>'))<CR>
" d: Find functions called by this function
nnoremap  <leader>fd :call CscopeFind('d', expand('<cword>'))<CR>
" c: Find functions calling this function
nnoremap  <leader>fc :call CscopeFind('c', expand('<cword>'))<CR>
" t: Find this text string
nnoremap  <leader>ft :call CscopeFind('t', expand('<cword>'))<CR>
" e: Find this egrep pattern
nnoremap  <leader>fe :call CscopeFind('e', expand('<cword>'))<CR>
" f: Find this file
nnoremap  <leader>ff :call CscopeFind('f', expand('<cword>'))<CR>
" i: Find files #including this file


"                                <File Header>
autocmd BufNewFile *.cpp,*.[ch],*.sh,*.java exec ":call SetTitle()"
func SetTitle()
    if &filetype == 'c'
		call setline(1, "/*-----------------------------------------------------------------")
	    call append(line("."),   "* Author      : Fitor")
        call append(line(".")+1, "* File Name   : ".expand("%"))
        call append(line(".")+2, "* Create Time : ".strftime("%c"))
        call append(line(".")+3, "* Email       : chen2033@live.com")
        call append(line(".")+4, "------------------------------------------------------------------*/")
        call append(line(".")+5, "")
    endif

    if &filetype == 'sh'
		call setline(1, "#-----------------------------------------------------------------")
	    call append(line("."),   "# Author      : Fitor")
        call append(line(".")+1, "# File Name   : ".expand("%"))
        call append(line(".")+2, "# Create Time : ".strftime("%c"))
        call append(line(".")+3, "# Email       : chen2033@live.com")
        call append(line(".")+4, "#------------------------------------------------------------------")
        call append(line(".")+5, "#!/bin/sh")
        call append(line(".")+6, "")
    endif

    autocmd BufNewFile * normal G
endfunc


"                                  <TEST>

"This is just a TEST
map <F4> :call MyTest()<CR>'s
func MyTest()
    call append(line("."), "Hello ~~~")
endfunc

" toggle the syntax status
nmap <leader>s :call ToggleSyntax()<CR>
function! ToggleSyntax()
    if exists("g:syntax_on")
        syntax off
    else
        syntax on
    endif
endfunction


