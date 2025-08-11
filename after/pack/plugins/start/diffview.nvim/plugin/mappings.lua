require('plugin_manager').load_package_on_command_s(
  'diffview.nvim',
  { 'DiffviewOpen', 'DiffviewFileHistory' }
)

vim.keymap.set(
  'n',
  '<leader>ga',
  '<cmd>DiffviewOpen<CR>',
  { desc = 'open interface for git staging area to add files' }
)

vim.keymap.set(
  'n',
  '<leader>gld',
  '<cmd>DiffviewFileHistory<CR>',
  { desc = 'open interface to inspect git history in diff mode' }
)

vim.keymap.set(
  'n',
  '<leader>glD',
  '<cmd>DiffviewFileHistory %<CR>',
  { desc = 'open interface to inspect git history in diff mode for current file only' }
)

vim.keymap.set('n', '<leader>glm', function()
  local function_name = vim.fn.expand('<cword>')
  local file_path = vim.fn.expand('%:p')
  local command = string.format('DiffviewFileHistory -L:%s:%s', function_name, file_path)
  vim.api.nvim_command(command)
end, { desc = 'open interface to inspect git history in diff mode for current function' })
