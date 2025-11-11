require('plugin_manager').lazy_load_plugin_on_command('nvim-treesitter-textobjects', {
  'TSTextobjectSelect',
  'TSTextobjectGotoNextStart',
  'TSTextobjectGotoPreviousStart',
  'TSTextobjectGotoNextEnd',
  'TSTextobjectGotoPreviousEnd',
})

vim.keymap.set({ 'o', 'v' }, 'am', function()
  vim.cmd.TSTextobjectSelect('@function.outer')
end, { desc = 'outer function text object' })

vim.keymap.set({ 'o', 'v' }, 'im', function()
  vim.cmd.TSTextobjectSelect('@function.inner')
end, { desc = 'inner function text object' })

vim.keymap.set({ 'n', 'o', 'v' }, ']m', function()
  vim.cmd.TSTextobjectGotoNextStart('@function.outer')
end, { desc = 'jump to start of next function' })

vim.keymap.set({ 'n', 'o', 'v' }, '[m', function()
  vim.cmd.TSTextobjectGotoPreviousStart('@function.outer')
end, { desc = 'jump to start of previous/current function' })

vim.keymap.set({ 'n', 'o', 'v' }, ']M', function()
  vim.cmd.TSTextobjectGotoNextEnd('@function.outer')
end, { desc = 'jump to end of next/current function' })

vim.keymap.set({ 'n', 'o', 'v' }, '[M', function()
  vim.cmd.TSTextobjectGotoPreviousEnd('@function.outer')
end, { desc = 'jump to end of previous function' })

vim.keymap.set({ 'o', 'v' }, 'ac', function()
  vim.cmd.TSTextobjectSelect('@class.outer')
end, { desc = 'outer class text object' })

vim.keymap.set({ 'o', 'v' }, 'ic', function()
  vim.cmd.TSTextobjectSelect('@class.inner')
end, { desc = 'inner class text object' })

vim.keymap.set({ 'n', 'o', 'v' }, ']c', function()
  vim.cmd.TSTextobjectGotoNextStart('@class.outer')
end, { desc = 'jump to start of next class' })

vim.keymap.set({ 'n', 'o', 'v' }, '[c', function()
  vim.cmd.TSTextobjectGotoPreviousStart('@class.outer')
end, { desc = 'jump to start of previous/current class' })

vim.keymap.set({ 'n', 'o', 'v' }, ']C', function()
  vim.cmd.TSTextobjectGotoNextEnd('@class.outer')
end, { desc = 'jump to end of next/current class' })

vim.keymap.set({ 'n', 'o', 'v' }, '[C', function()
  vim.cmd.TSTextobjectGotoPreviousEnd('@class.outer')
end, { desc = 'jump to end previous class' })

vim.keymap.set({ 'o', 'v' }, 'aa', function()
  vim.cmd.TSTextobjectSelect('@parameter.outer')
end, { desc = 'parameter class text object' })

vim.keymap.set({ 'o', 'v' }, 'ia', function()
  vim.cmd.TSTextobjectSelect('@parameter.inner')
end, { desc = 'inner parameter text object' })

vim.keymap.set({ 'n', 'o', 'v' }, ']a', function()
  vim.cmd.TSTextobjectGotoNextStart('@parameter.outer')
end, { desc = 'jump to start of next parameter' })

vim.keymap.set({ 'n', 'o', 'v' }, ']A', function()
  vim.cmd.TSTextobjectGotoNextEnd('@parameter.outer')
end, { desc = 'jump to start of previous/current parameter' })

vim.keymap.set({ 'n', 'o', 'v' }, '[a', function()
  vim.cmd.TSTextobjectGotoPreviousStart('@parameter.outer')
end, { desc = 'jump to end of next/current parameter' })

vim.keymap.set({ 'n', 'o', 'v' }, '[A', function()
  vim.cmd.TSTextobjectGotoPreviousEnd('@parameter.outer')
end, { desc = 'jump to end previous parameter' })

vim.keymap.set({ 'o', 'v' }, 'a/', function()
  vim.cmd.TSTextobjectSelect('@comment.outer')
end, { desc = 'outer comment text object' })

vim.keymap.set({ 'o', 'v' }, 'i/', function()
  vim.cmd.TSTextobjectSelect('@comment.outer')
end, { desc = 'inner comment text object' })

vim.keymap.set(
  { 'n', 'o', 'v' },
  ']/ :',
  'c-u>TSTextobjectGotoNextStart @comment.outer<cr>',
  { desc = 'jump to start of next comment' }
)

vim.keymap.set(
  { 'n', 'o', 'v' },
  '[/ :',
  'c-u>TSTextobjectGotoPreviousStart @comment.outer<cr>',
  { desc = 'jump to start of previous/current comment' }
)
