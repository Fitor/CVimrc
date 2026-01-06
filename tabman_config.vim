if exists("g:did_tabman_config")
    finish
en
let g:did_tabman_config = 1

nmap <leader>tt  :TMToggle<CR>
nmap <leader>tn  :tabnew<CR>
nmap <leader>tc  :tabc<CR>

func s:later_close_on_win_leave_handler(timer)
    if &filetype !=# 'tabman'
        cal tabman#close()
    endif
endfunc

function! s:close_tabman_on_win_leave()
    if &filetype ==# 'tabman'
        call timer_start(20, "s:later_close_on_win_leave_handler")
    endif
endfunction

let s:processing = 0
let s:last_tab = 1

func s:later_close_on_tab_leave_handler(timer)
    let current_tab = tabpagenr()

    if s:last_tab ==# current_tab
        return
    endif

    let s:processing = 1
    execute s:last_tab.' tabdo call tabman#close()'
    execute 'tabnext ' . current_tab
    let s:processing = 0
endfunc

function! s:close_tabman_on_tab_leave()
    let s:last_tab = tabpagenr()
    if s:processing ==# 1
        return
    endif
    call timer_start(20, "s:later_close_on_tab_leave_handler")
endfunction

" close tabman when leave tabman window
autocmd WinLeave * call s:close_tabman_on_win_leave()
" close tabman when leave current tab
autocmd TabLeave * call s:close_tabman_on_tab_leave()
