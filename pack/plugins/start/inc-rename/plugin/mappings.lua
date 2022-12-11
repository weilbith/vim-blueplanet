vim.keymap.set('n', '<leader>rr', function()
  return ':IncRename ' .. vim.fn.expand('<cword>')
end, { expr = true })
