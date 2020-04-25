" Completion menu key bindings.
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>"
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Complete snippet from visual mode.
vnoremap <silent> <Tab> <Esc>:call UltiSnips#SaveLastVisualSelection()<CR>gvs

" Jump to next snippet placeholder.
inoremap <silent> <C-space> <C-r>=UltiSnips#JumpForwards()<CR>
snoremap <silent> <C-space> <Esc>:<C-u>call UltiSnips#JumpForwards()<CR>
nnoremap <silent> <C-space> :<C-u>call UltiSnips#JumpForwards()<CR>

" Jump to previous snippet placeholder.
inoremap <silent> <C-b> <C-r>=UltiSnips#JumpBackwards()<CR>
snoremap <silent> <C-b> <Esc>:<C-u>call UltiSnips#JumpBackwards()<CR>
nnoremap <silent> <C-b> :<C-u>call UltiSnips#JumpBackwards()<CR>

" Complete function with parameter.
imap <expr> (
            \ pumvisible() ?
            \ cmp#pre_complete('()') :
            \ "\<Plug>delimitMate("

" Next parameter from completion.
nmap <C-l> <Plug>(complete_parameter#goto_next_parameter)
imap <C-l> <Plug>(complete_parameter#goto_next_parameter)

" Previous parameter from completion.
nmap <C-h> <Plug>(complete_parameter#goto_previous_parameter)
imap <C-h> <Plug>(complete_parameter#goto_previous_parameter)

" Key mapping completion menus
nnoremap <silent> <leader> :<C-u>WhichKey '<Space>'<CR>
nnoremap <silent> <localleader> :<C-u>WhichKey '\'<CR>
