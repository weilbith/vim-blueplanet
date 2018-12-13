" Complete snippets (require NeoSnippet plugin).
imap <C-Space> <Plug>(neosnippet_expand_or_jump)
smap <C-Space> <Plug>(neosnippet_expand_or_jump
xmap <C-Space> <Plug>(neosnippet_expand_target)

" Completion menu key bindings.
inoremap <expr> <Tab> pumvisible() ? "\<C-y>" : "\<Tab>"
inoremap <expr> <C-j> pumvisible() ? "\<Down>" : "\<C-j>"
inoremap <expr> <C-k> pumvisible() ? "\<Up>" : "\<C-k>"

" Open a new line with <CR> but do not except the completion.
" Remark to not overwrite DelimitMate's mapping.
inoremap <expr> <CR> pumvisible() ? "\<Esc>o" : delimitMate#ExpandReturn()

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
