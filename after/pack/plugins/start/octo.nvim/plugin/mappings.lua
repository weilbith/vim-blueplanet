require('plugin_manager').lazy_load_plugin_on_command('octo.nvim', 'Octo')

vim.keymap.set(
  'n',
  '<leader>gii',
  '<cmd>Octo issue list<CR>',
  { desc = 'list of all GitHub issues' }
)

vim.keymap.set(
  'n',
  '<leader>giI',
  '<cmd>Octo issue list states=OPEN assignee=weilbith<CR>',
  { desc = 'list of GitHub issues that are open and assigned to myself' }
)

vim.keymap.set(
  'n',
  '<leader>gio',
  '<cmd>Octo issue create<CR>',
  { desc = 'open a new issue on GitHub' }
)

vim.keymap.set(
  'n',
  '<leader>gmm',
  '<cmd>Octo pr list<CR>',
  { desc = 'list of all GitHub pull requests' }
)

vim.keymap.set(
  'n',
  '<leader>gmM',
  '<cmd>Octo pr list states=OPEN<CR>',
  { desc = 'list of open GitHub pull requests' }
)
