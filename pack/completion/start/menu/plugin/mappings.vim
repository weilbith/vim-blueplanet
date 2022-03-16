imap <unique> <expr> <Tab>   completion_menu#is_open() ? "\<C-n>" : "\<Tab>"
imap <unique> <expr> <S-Tab> completion_menu#is_open() ? "\<C-p>" : "\<S-Tab>"
imap <unique> <expr> <CR>    completion_menu#is_open_and_entry_selected() ? "\<C-y>" : "\<CR>"
