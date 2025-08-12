vim.keymap.set('n', 'gd', function()
  require('nvim-treesitter-refactor.navigation').goto_definition()
end, { desc = 'go to local definition of target under cursor (by Treesitter)' })

vim.keymap.set('n', ']r', function()
  require('nvim-treesitter-refactor.navigation').goto_next_usage()
end, { desc = 'go to next usage of target under cursor' })

vim.keymap.set('n', '[r', function()
  require('nvim-treesitter-refactor.navigation').goto_previous_usage()
end, { desc = 'go to previous usage of target under cursor' })
