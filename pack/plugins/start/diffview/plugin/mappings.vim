nnoremap <leader>gld <cmd>DiffviewFileHistory<CR>
nnoremap <leader>glD <cmd>DiffviewFileHistory %<CR>
nnoremap <leader>glm <cmd>execute 'DiffviewFileHistory -L:' . expand('<cword>') . ':' . expand('%:p')<CR>
