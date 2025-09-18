vim.keymap.set('n', '<leader>rr', vim.lsp.buf.rename, { unique = true })
vim.keymap.set('n', '<leader>rR', vim.lsp.buf.rename) -- Backup for fallback if overwrite failed.

vim.keymap.set('n', '<leader>rf', function()
  local new_name = vim.fn.expand('<cword>')
  vim.cmd.undo({ bang = true })
  vim.lsp.buf.rename(new_name)
end, {
  desc = 'apply forgotten symbol rename for last text edit',
})
