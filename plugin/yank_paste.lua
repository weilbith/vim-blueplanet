-- Paste in visual mode from unnamed register does not overwrite it.
vim.keymap.set('v', 'p', "p:if v:register == '\"'<Bar>let @@=@0<Bar>endif<cr>")

local group = vim.api.nvim_create_augroup('YankPaste', {})
vim.api.nvim_create_autocmd('TextYankPost', {
  group = group,
  callback = vim.hl.on_yank,
  desc = 'highlight yanked text',
})
