inoremap <buffer> <C-l> <cmd>lua require('telescope.actions').cycle_previewers_next(vim.api.nvim_get_current_buf())<CR>
inoremap <buffer> <C-h> <cmd>lua require('telescope.actions').cycle_previewers_prev(vim.api.nvim_get_current_buf())<CR>

inoremap <buffer> <C-j> <cmd>lua require('telescope.actions').cycle_history_next(vim.api.nvim_get_current_buf())<CR>
inoremap <buffer> <C-k> <cmd>lua require('telescope.actions').cycle_history_prev(vim.api.nvim_get_current_buf())<CR>
