vim.keymap.set('n', '<leader><leader>dd', function()
  require('duck').hatch()
end, {})

vim.keymap.set('n', '<leader><leader>dk', function()
  require('duck').cook()
end, {})
