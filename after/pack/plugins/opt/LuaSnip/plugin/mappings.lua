-- Relies mostly on mappings in the package 'abstractions > snippets'

vim.keymap.set({ 'i', 's' }, '<C-c>', function()
  require('luasnip').change_choice(1)
end, {
  desc = 'cycle through choice nodes of active snippet',
})
