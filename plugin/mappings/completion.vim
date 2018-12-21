" Completion menu key bindings.
inoremap <expr> <Tab> pumvisible() ? "\<C-y>" : "\<Tab>"
inoremap <expr> <C-j> pumvisible() ? "\<Down>" : "\<C-j>"
inoremap <expr> <C-k> pumvisible() ? "\<Up>" : "\<C-k>"
inoremap <expr> <Esc> pumvisible() ? "\<C-e>" : "\<Esc>"

" Open a new line with <CR> but do not except the completion.
" Remark to not overwrite DelimitMate's mapping.
inoremap <expr> <CR> pumvisible() ? "\<Esc>o" : delimitMate#ExpandReturn()

" Jump to next snippet placeholder.
inoremap <silent> <C-Space> <C-r>=UltiSnips#JumpForwards()<CR>
snoremap <silent> <C-Space> <Esc>:<C-u>call UltiSnips#JumpForwards()<CR>
nnoremap <silent> <C-Space> :<C-u>call UltiSnips#JumpForwards()<CR>

" Jump to previous snippet placeholder.
inoremap <silent> <C-b> <C-r>=UltiSnips#JumpBackwards()<CR>
snoremap <silent> <C-b> <Esc>:<C-u>call UltiSnips#JumpBackwards()<CR>
nnoremap <silent> <C-b> :<C-u>call UltiSnips#JumpBackwards()<CR>


" Complete parameter mappings.
imap <expr> ( pumvisible() ? complete_parameter#pre_complete('()') : "\<Plug>delimitMate("

" Next parameter
nmap <C-l> <Plug>(complete_parameter#goto_next_parameter)
imap <C-l> <Plug>(complete_parameter#goto_next_parameter)

" Previous parameter
nmap <C-h> <Plug>(complete_parameter#goto_previous_parameter)
imap <C-h> <Plug>(complete_parameter#goto_previous_parameter)

" " Next overload function
" nmap <C-j> <Plug>(cmp#overload_down)
" imap <C-j> <Plug>(cmp#overload_down)
"
" " Previous overload function
" nmap <C-k> <Plug>(cmp#overload_up)
" imap <C-k> <Plug>(cmp#overload_up)
