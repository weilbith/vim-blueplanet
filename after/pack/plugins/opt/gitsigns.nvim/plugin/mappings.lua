vim.keymap.set('n', '<leader>gm', function()
  vim.cmd.Gitsigns('blame_line')
end, { desc = 'show/blame git commit for line under cursor' })

vim.keymap.set('n', '<leader>gdh', function()
  vim.cmd.Gitsigns('preview_hunk_inline')
end, { desc = 'preview the diff of the git hunk under the cursor' })

vim.keymap.set('n', '<leader>gsh', function()
  vim.cmd.Gitsigns('stage_hunk')
end, { desc = 'stage the current git change hunk under the cursor' })

vim.keymap.set(
  'v',
  '<leader>gs',
  ':Gitsigns stage_hunk<CR>',
  { desc = 'stage the selected git changes' }
)

vim.keymap.set('n', '<leader>gsf', function()
  vim.cmd.Gitsigns('stage_buffer')
end, { desc = 'stage the whole file with all git changes' })

vim.keymap.set('n', '<leader>grh', function()
  vim.cmd.Gitsigns('reset_hunk')
end, { desc = 'reset the git change hunk under the cursor' })

vim.keymap.set(
  'v',
  '<leader>gr',
  ':Gitsigns reset_hunk<CR>',
  { desc = 'reset the selected git changes' }
)

vim.keymap.set('n', '<leader>grf', function()
  vim.cmd.Gitsigns('reset_buffer')
end, { desc = 'reset the whole file with all git changes' })

vim.keymap.set({ 'v', 'o', 'x' }, 'ih', function()
  vim.cmd.Gitsigns('select_hunk')
end, { desc = 'select range of surrounding git change hunk' })

vim.keymap.set('n', ']c', function()
  if vim.wo.diff then
    vim.cmd.normal({ ']c', bang = true })
  else
    vim.cmd.Gitsigns('nav_hunk next')
  end
end, { desc = 'jump to next git change hunk' })

vim.keymap.set('n', '[c', function()
  if vim.wo.diff then
    vim.cmd.normal({ '[c', bang = true })
  else
    vim.cmd.Gitsigns('nav_hunk prev')
  end
end, { desc = 'jump to previous git change hunk' })
