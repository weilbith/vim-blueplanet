vim.keymap.set('n', '<C-l>', function()
  require('tsht').move({ side = 'end' })
end, { desc = 'show marker for the "end" of Treesitter based text objects to jump to' })

vim.keymap.set('n', '<C-h>', function()
  require('tsht').move({ side = 'start' })
end, { desc = 'show marker for the "start" of Treesitter based text objects to jump to' })

vim.keymap.set({ 'v', 'o' }, '<leader><leader>', function()
  require('tsht').nodes()
end, { desc = 'show markers for Treesitter based text objects to select' })
