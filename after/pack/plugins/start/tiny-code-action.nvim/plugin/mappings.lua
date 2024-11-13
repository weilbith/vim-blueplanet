vim.keymap.set({ 'n', 'x' }, 'gra', function()
  require('tiny-code-action').code_action()
end, {
  desc = 'open menu with available code actions and their preview',
  noremap = true,
  silent = true,
})
