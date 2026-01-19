if exists("g:map_config") && g:map_config
    finish
endif
let g:map_config = 1

" cvim
nmap <silent> <leader>cd :call cvim#fcd()<CR>

nmap <silent> <leader>fg :call cvim#files()<CR>
nmap <silent> <leader>ff :call cvim#curfiles()<CR>
nmap <silent> <leader>ft :call cvim#grep()<CR>
nmap <silent> <leader>fr :call cvim#curgrep()<CR>

" terminal quick shell command
tnoremap <expr> <C-W>p cvim#term_quickcmd()

" quickfix
map <leader>qo :cw<CR>
map <leader>qc :ccl<CR>
map <leader>qf :cfirst<CR>
map <leader>qn :cnext<CR>
map <leader>qp :cprev<CR>
map <leader>ql :clast<CR>

" goyo
nmap <leader>g :Goyo<CR>

" get the root right to write
cmap w!! w !sudo tee > /dev/null %

" codeium
nmap <silent> <leader>ao :Codeium Enable<CR>
nmap <silent> <leader>ac :Codeium Disable<CR>
imap <script><silent><nowait><expr> <leader>aa codeium#Accept()
imap <leader>aj <Cmd>call codeium#CycleCompletions(1)<CR>
imap <leader>ak <Cmd>call codeium#CycleCompletions(-1)<CR>

" ctrl-funky
nnoremap <Leader>fu :CtrlPFunky<Cr>
    " narrow the list down with a word under cursor
nnoremap <Leader>fU :execute 'CtrlPFunky ' . expand('<cword>')<Cr>

" nerdtree
nmap <leader>e :NERDTreeToggle<cr>

" tabman
nmap <leader>tt  :TMToggle<CR>
nmap <leader>tn  :tabnew<CR>
nmap <leader>tc  :tabc<CR>

" ctrlp
let g:ctrlp_map = '<leader>p'
map <leader>f :CtrlPMRU<CR>

" cscope
map g<C-]> :cs find 3 <C-R>=expand("<cword>")<CR><CR>
map g<C-\> :cs find 0 <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <C-\>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>

" ultisnips
imap <TAB> <Plug>snipMateTrigger
imap <C-J> <Plug>snipMateNextOrTrigger
smap <C-J> <Plug>snipMateNextOrTrigger
imap <C-K> <Plug>snipMateBack
smap <C-K> <Plug>snipMateBack

" easymotion
map <Leader><leader>h <Plug>(easymotion-linebackward)
map <Leader><Leader>j <Plug>(easymotion-j)
map <Leader><Leader>k <Plug>(easymotion-k)
map <Leader><leader>l <Plug>(easymotion-lineforward)
map <Leader><leader>. <Plug>(easymotion-repeat)
