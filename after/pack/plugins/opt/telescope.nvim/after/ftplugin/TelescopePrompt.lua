vim.keymap.set('i', '<C-l>', function()
  require('telescope.actions').cycle_previewers_next(vim.api.nvim_get_current_buf())
end, { desc = 'cycle to next previewer', buffer = true })

vim.keymap.set('i', '<C-h>', function()
  require('telescope.actions').cycle_previewers_prev(vim.api.nvim_get_current_buf())
end, { desc = 'cycle to previous previewer', buffer = true })

vim.keymap.set('i', '<C-j>', function()
  require('telescope.actions').cycle_history_next(vim.api.nvim_get_current_buf())
end, { desc = 'cycle to next session of active picker', buffer = true })

vim.keymap.set('i', '<C-k>', function()
  require('telescope.actions').cycle_history_prev(vim.api.nvim_get_current_buf())
end, { desc = 'cycle to previous session of active picker ("last fuzzy search")', buffer = true })
