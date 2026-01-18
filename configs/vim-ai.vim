" Vim File
" AUTHOR:   ci
" FILE:     vim-ai_config.vim
" ROLE:     TODO (some explanation)
" CREATED:  2025-03-02 23:10:24
" MODIFIED: 2025-03-02 23:10:24

if exists("did_vim_ai_config")
    finish
endif
let did_vim_ai_config = 1

let g:vim_ai_token_file_path = g:cv_vim_ai_config.token_file

if exists("g:cv_vim_ai_config.rols_config_file")
    let g:vim_ai_roles_config_file = g:cv_vim_ai_config.rols_config_file
endif

let s:initial_complete_prompt =<< trim END
    >>> system

    You are a general assistant.
    Answer shortly, consisely and only what you are asked.
    Do not provide any explanantion or comments if not requested.
    If you answer in a code, do not wrap it in markdown code block.
END

let g:vim_ai_complete = {
            \   "engine": "chat",
            \   "options": {
            \       "model": g:cv_vim_ai_config.complete.model,
            \       "endpoint_url": g:cv_vim_ai_config.complete.endpoint_url,
            \       "max_tokens": 0,
            \       "max_completion_tokens": 0,
            \       "temperature": 0.1,
            \       "request_timeout": 20,
            \       "stream": 1,
            \       "enable_auth": 1,
            \       "token_file_path": "",
            \       "selection_boundary": "#####",
            \       "initial_prompt": s:initial_complete_prompt,
            \   },
            \   "ui": {
            \       "paste_mode": 1,
            \   },
            \}

let g:vim_ai_edit = {
            \   "engine": "chat",
            \   "options": {
            \       "model": g:cv_vim_ai_config.edit.model,
            \       "endpoint_url": g:cv_vim_ai_config.edit.endpoint_url,
            \       "max_tokens": 0,
            \       "max_completion_tokens": 0,
            \       "temperature": 0.1,
            \       "request_timeout": 20,
            \       "stream": 1,
            \       "enable_auth": 1,
            \       "token_file_path": "",
            \       "selection_boundary": "#####",
            \       "initial_prompt": s:initial_complete_prompt,
            \   },
            \   "ui": {
            \       "paste_mode": 1,
            \   },
            \}

let s:initial_chat_prompt =<< trim END
    >>> system

    You are a general assistant.
    If you attach a code block add syntax type after ``` to enable syntax highlighting.
END

let g:vim_ai_chat = {
            \   "options": {
            \       "model": g:cv_vim_ai_config.edit.model,
            \       "max_tokens": 0,
            \       "max_completion_tokens": 0,
            \       "endpoint_url": g:cv_vim_ai_config.edit.endpoint_url,
            \       "temperature": 1,
            \       "request_timeout": 20,
            \       "stream": 1,
            \       "enable_auth": 1,
            \       "token_file_path": "",
            \       "selection_boundary": "",
            \       "initial_prompt": s:initial_chat_prompt,
            \   },
            \   "ui": {
            \       "code_syntax_enabled": 1,
            \       "populate_options": 0,
            \       "open_chat_command": "preset_below",
            \       "scratch_buffer_keep_open": 0,
            \       "paste_mode": 1,
            \   },
            \}
