require('plugin_manager').load_package_on_command_s('telescope.nvim', 'Telescope')

vim.keymap.set(
  'n',
  '<leader>ff',
  '<cmd>Telescope find_files<CR>',
  { desc = 'search for files in fuzzy finder' }
)

vim.keymap.set(
  'n',
  '<leader>bb',
  '<cmd>Telescope buffers<CR>',
  { desc = 'search for buffers in fuzzy finder' }
)

vim.keymap.set(
  'n',
  '<leader>ss',
  '<cmd>Telescope live_grep<CR>',
  { desc = 'search for text ("grep") in fuzzy finder' }
)

vim.keymap.set(
  'n',
  '<leader>sw',
  '<cmd>Telescope grep_string<CR>',
  { desc = 'search for word under cursor in fuzzy finder' }
)

vim.keymap.set(
  'n',
  '<leader>sr',
  '<cmd>Telescope resum<CR>',
  { desc = 'resume last search in fuzzy finder' }
)

vim.keymap.set(
  'n',
  '<leader>sR',
  '<cmd>Telescope pickers<CR>',
  { desc = 'list of last fuzzy finder sessions' }
)

vim.keymap.set(
  'n',
  '<leader>gl',
  '<cmd>Telescope git_commits<CR>',
  { desc = 'list git commits with preview information' }
)

vim.keymap.set(
  'n',
  '<leader>ql',
  '<cmd>Telescope quickfixhistory<CR>',
  { desc = 'list history of quickfix lists' }
)

vim.keymap.set('c', 'he', function()
  local is_ex_command = vim.fn.getcmdtype() == ':'
  local is_at_start_of_command_line = vim.fn.getcmdpos() == 1
  local should_open_finder_for_help_tags = is_ex_command and is_at_start_of_command_line
  return should_open_finder_for_help_tags and 'Telescope help_tags<CR>' or 'he'
end, {
  expr = true,
  noremap = true,
  desc = "quickly open fuzzy finder for help tags when trying to trigger ':help'",
})
