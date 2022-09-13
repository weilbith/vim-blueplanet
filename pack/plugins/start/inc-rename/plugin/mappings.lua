vim.keymap.set('n', '<leader>rr', function()
  require('inc_rename') -- Workaround for lazy loading.
  return ':IncRename ' .. vim.fn.expand('<cword>')
end, { expr = true })
