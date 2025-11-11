vim.keymap.set('n', '<leader>fr', function()
  vim.cmd.Glance('vue_file_references')
end, { desc = 'peek references to Vue component defined in file', buffer = true })
