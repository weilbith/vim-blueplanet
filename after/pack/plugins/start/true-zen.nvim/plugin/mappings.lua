vim.keymap.set('n', '<leader>wf', function()
  require('true-zen.focus').toggle()
end, { desc = 'toggle focus of current window in "zen-mode", hiding all other windows' })
