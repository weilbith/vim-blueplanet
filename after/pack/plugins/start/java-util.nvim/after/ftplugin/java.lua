vim.cmd.packadd('java-util.nvim')

vim.keymap.set('n', 'grn', function()
  vim.cmd.JavaUtil('lsp_rename')
end, { desc = 'Java specific renaming that also handles Lombok', buffer = true })

vim.keymap.set('n', '<localleader>tr', function()
  vim.cmd.JavaUtil('lsp_goto_test')
end, { desc = 'jump to related test', buffer = true })
