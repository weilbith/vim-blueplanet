vim.keymap.set(
  { 'o', 'v' },
  'am',
  '<cmd>TSTextobjectSelect @function.outer<CR>',
  { desc = 'outer function text object' }
)

vim.keymap.set(
  { 'o', 'v' },
  'im',
  '<cmd>TSTextobjectSelect @function.inner<CR>',
  { desc = 'inner function text object' }
)

vim.keymap.set(
  { 'n', 'o', 'v' },
  ']m',
  '<cmd>TSTextobjectGotoNextStart @function.outer<CR>',
  { desc = 'jump to start of next function' }
)

vim.keymap.set(
  { 'n', 'o', 'v' },
  '[m',
  '<cmd>TSTextobjectGotoPreviousStart @function.outer<CR>',
  { desc = 'jump to start of previous/current function' }
)

vim.keymap.set(
  { 'n', 'o', 'v' },
  ']M',
  '<cmd>TSTextobjectGotoNextEnd @function.outer<CR>',
  { desc = 'jump to end of next/current function' }
)

vim.keymap.set(
  { 'n', 'o', 'v' },
  '[M',
  '<cmd>TSTextobjectGotoPreviousEnd @function.outer<CR>',
  { desc = 'jump to end of previous function' }
)

vim.keymap.set(
  { 'o', 'v' },
  'ac',
  '<cmd>TSTextobjectSelect @class.outer<CR>',
  { desc = 'outer class text object' }
)

vim.keymap.set(
  { 'o', 'v' },
  'ic',
  '<cmd>TSTextobjectSelect @class.inner<CR>',
  { desc = 'inner class text object' }
)

vim.keymap.set(
  { 'n', 'o', 'v' },
  ']c',
  '<cmd>TSTextobjectGotoNextStart @class.outer<CR>',
  { desc = 'jump to start of next class' }
)

vim.keymap.set(
  { 'n', 'o', 'v' },
  '[c',
  '<cmd>TSTextobjectGotoPreviousStart @class.outer<CR>',
  { desc = 'jump to start of previous/current class' }
)

vim.keymap.set(
  { 'n', 'o', 'v' },
  ']C',
  '<cmd>TSTextobjectGotoNextEnd @class.outer<CR>',
  { desc = 'jump to end of next/current class' }
)

vim.keymap.set(
  { 'n', 'o', 'v' },
  '[C',
  '<cmd>TSTextobjectGotoPreviousEnd @class.outer<CR>',
  { desc = 'jump to end previous class' }
)

vim.keymap.set(
  { 'o', 'v' },
  'aa',
  '<cmd>TSTextobjectSelect @parameter.outer<CR>',
  { desc = 'parameter class text object' }
)

vim.keymap.set(
  { 'o', 'v' },
  'ia',
  '<cmd>TSTextobjectSelect @parameter.inner<CR>',
  { desc = 'inner parameter text object' }
)

vim.keymap.set(
  { 'n', 'o', 'v' },
  ']a',
  '<cmd>TSTextobjectGotoNextStart @parameter.outer<CR>',
  { desc = 'jump to start of next parameter' }
)

vim.keymap.set(
  { 'n', 'o', 'v' },
  ']A',
  '<cmd>TSTextobjectGotoNextEnd @parameter.outer<CR>',
  { desc = 'jump to start of previous/current parameter' }
)

vim.keymap.set(
  { 'n', 'o', 'v' },
  '[a',
  '<cmd>TSTextobjectGotoPreviousStart @parameter.outer<CR>',
  { desc = 'jump to end of next/current parameter' }
)

vim.keymap.set(
  { 'n', 'o', 'v' },
  '[A',
  '<cmd>TSTextobjectGotoPreviousEnd @parameter.outer<CR>',
  { desc = 'jump to end previous parameter' }
)

vim.keymap.set(
  { 'o', 'v' },
  'a/',
  '<cmd>TSTextobjectSelect @comment.outer<CR>',
  { desc = 'outer comment text object' }
)

vim.keymap.set(
  { 'o', 'v' },
  'i/',
  '<cmd>TSTextobjectSelect @comment.outer<CR>',
  { desc = 'inner comment text object' }
)

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
