require('plugin_manager').lazy_load_plugin_on_command(
  'hop.nvim',
  { 'HopWordAC', 'HopWordBC', 'HopLineAC', 'HopLineBC', 'HopChar1AC', 'HopChar1BC' }
)

vim.keymap.set({ 'n', 'x' }, '<BS>w', vim.cmd.HopWordAC)
vim.keymap.set({ 'n', 'x' }, '<BS>b', vim.cmd.HopWordBC)

vim.keymap.set({ 'n', 'x' }, '<BS>j', vim.cmd.HopLineAC)
vim.keymap.set({ 'n', 'x' }, '<BS>k', vim.cmd.HopWordBC)

vim.keymap.set({ 'n', 'x' }, '<BS>f', vim.cmd.HopChar1AC)
vim.keymap.set({ 'n', 'x' }, '<BS>F', vim.cmd.HopChar1BC)

require('plugin_manager').lazy_load_plugin_on_lua_module('hop.nvim', 'hop')
require('plugin_manager').lazy_load_plugin_on_lua_module('hop-extensions', 'hop-extensions')

vim.keymap.set({ 'n', 'v' }, '<BS>o', function()
  require('hop-extensions').ts.hint_locals()
end)

vim.keymap.set({ 'n', 'v' }, '<BS>m', function()
  require('hop-extensions').ts.hint_textobjects({}, '@function')
end)

vim.keymap.set({ 'n', 'v' }, '<BS>a', function()
  require('hop-extensions').ts.hint_textobjects({}, '@parameter')
end)

vim.keymap.set({ 'n', 'v' }, '<BS>/', function()
  require('hop-extensions').ts.hint_textobjects({}, '@comment')
end)

vim.keymap.set('n', '<BS>d', function()
  require('hop-extensions').hint_diagnostics()
end)

vim.keymap.set('n', '<BS>r', function()
  require('hop-extensions').lsp.hint_references()
end)
