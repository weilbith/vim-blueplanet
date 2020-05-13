" Completion menu key bindings.
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>"
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Complete snippet from visual mode.
vnoremap <silent> <Tab> <cmd>call UltiSnips#SaveLastVisualSelection()<CR>gvs

" Jump to next snippet placeholder.
inoremap <silent> <C-space> <C-r>=UltiSnips#JumpForwards()<CR>
snoremap <silent> <C-space> <cmd>call UltiSnips#JumpForwards()<CR>
nnoremap <silent> <C-space> <cmd>call UltiSnips#JumpForwards()<CR>

" Jump to previous snippet placeholder.
inoremap <silent> <C-b> <C-r>=UltiSnips#JumpBackwards()<CR>
snoremap <silent> <C-b> <cmd>call UltiSnips#JumpBackwards()<CR>
nnoremap <silent> <C-b> <cmd>call UltiSnips#JumpBackwards()<CR>

" Key mapping completion menus
nnoremap <silent> <leader> <cmd>WhichKey '<Space>'<CR>
nnoremap <silent> <localleader> <cmd>WhichKey '\'<CR>
