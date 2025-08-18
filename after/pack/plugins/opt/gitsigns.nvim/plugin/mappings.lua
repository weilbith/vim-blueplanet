local escape_and_feed_keys = require('custom.utils').escape_and_feed_keys

vim.keymap.set(
  'n',
  '<leader>gm',
  '<cmd>Gitsigns blame_line<CR>',
  { desc = 'show/blame git commit for line under cursor' }
)

vim.keymap.set(
  'n',
  '<leader>ghd',
  '<cmd>Gitsigns preview_hunk_inline<CR>',
  { desc = 'preview the diff of the git hunk under the cursor' }
)

vim.keymap.set(
  'n',
  '<leader>ghs',
  '<cmd>Gitsigns stage_hunk<CR>',
  { desc = 'stage the current git change hunk under the cursor' }
)

vim.keymap.set(
  'v',
  '<leader>gs',
  ':Gitsigns stage_hunk<CR>',
  { desc = 'stage the selected git changes' }
)

vim.keymap.set(
  'n',
  '<leader>gS',
  '<cmd>Gitsigns stage_buffer<CR>',
  { desc = 'stage the whole buffer with all git changes' }
)

vim.keymap.set(
  'n',
  '<leader>ghr',
  '<cmd>Gitsigns reset_hunk<CR>',
  { desc = 'reset the git change hunk under the cursor' }
)

vim.keymap.set(
  'v',
  '<leader>gr',
  ':Gitsigns reset_hunk<CR>',
  { desc = 'reset the selected git changes' }
)

vim.keymap.set(
  'n',
  '<leader>gR',
  '<cmd>Gitsigns reset_buffer<CR>',
  { desc = 'reset the whole buffer with all git changes' }
)

vim.keymap.set(
  { 'v', 'o', 'x' },
  'ih',
  '<cmd>Gitsigns select_hunk<CR>',
  { desc = 'select range of surrounding git change hunk' }
)

vim.keymap.set('n', ']c', function()
  if vim.wo.diff then
    escape_and_feed_keys(']c', 'n')
  else
    vim.cmd('Gitsigns nav_hunk next')
  end
end, {
  desc = 'jump to next git change hunk',
})

vim.keymap.set('n', '[c', function()
  if vim.wo.diff then
    escape_and_feed_keys('[c', 'n')
  else
    vim.cmd('Gitsigns nav_hunk prev')
  end
end, {
  desc = 'jump to previous git change hunk',
})
