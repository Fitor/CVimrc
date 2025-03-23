if exists("syntax_config")
    finish
endif
let syntax_config = 1

highlight extraSpace  ctermbg=red guibg=red
match extraSpace /\v\s+$/
