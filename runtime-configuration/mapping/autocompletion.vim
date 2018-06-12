" Complete snippets (require NeoSnippet plugin).
imap <C-Space> <Plug>(neosnippet_expand_or_jump)
smap <C-Space> <Plug>(neosnippet_expand_or_jump
xmap <C-Space> <Plug>(neosnippet_expand_target)

" Completion menu key bindings.
inoremap <expr> <Tab> pumvisible() ? "\<C-y>" : "\<Tab>"
inoremap <expr> <C-j> pumvisible() ? "\<Down>" : "\<C-j>"
inoremap <expr> <C-k> pumvisible() ? "\<C-y>" : "\<C-k>"

" Open a new line with <CR> but do not except the completion.
" Remark to not overwrite DelimitMate's mapping.
inoremap <expr> <CR> pumvisible() ? "\<Esc>o" : delimitMate#ExpandReturn()
