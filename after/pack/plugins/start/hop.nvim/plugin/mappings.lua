vim.keymap.set({ 'n', 'v' }, '<BS>o', function()
  require('hop-extensions').ts.hint_locals()
end)

vim.keymap.set({ 'n', 'v' }, '<BS>m', function()
  require('hop-extensions').ts.hint_textobjects({}, '@function')
end)

vim.keymap.set({ 'n', 'v' }, '<BS>p', function()
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
