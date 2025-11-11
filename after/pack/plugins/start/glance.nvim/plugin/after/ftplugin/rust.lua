vim.keymap.set('n', '<localleader>tr', function()
  vim.cmd.Glance('rust-analyzer_related-tests')
end, { desc = 'peek usages in tests of target under cursor', buffer = true })
