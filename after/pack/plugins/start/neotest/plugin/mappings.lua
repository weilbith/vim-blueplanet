require('plugin_manager').load_package_on_command_s('neotest', 'Neotest')
require('plugin_manager').load_package_on_require_lua_module('neotest', 'neotest')

vim.keymap.set('n', '<localleader>tn', '<cmd>Neotest run<CR>', { desc = 'run test case at cursor' })

vim.keymap.set(
  'n',
  '<localleader>tl',
  '<cmd>Neotest run last<CR>',
  { desc = 're-run last test case again' }
)

vim.keymap.set(
  'n',
  '<localleader>td',
  '<cmd>Neotest run strategy=dap<CR>',
  { desc = 'run test case at cursor in debug mode' }
)

vim.keymap.set(
  'n',
  '<localleader>tf',
  '<cmd>Neotest run file<CR>',
  { desc = 'run all test case in current file' }
)

vim.keymap.set(
  'n',
  '<localleader>ta',
  '<cmd>Neotest attach<CR>',
  { desc = 'attach to the current test run and observe logs' }
)

vim.keymap.set(
  'n',
  '<localleader>to',
  '<cmd>Neotest output enter=true<CR>',
  { desc = 'open the output of the (failed) test case at cursor' }
)

vim.keymap.set(
  'n',
  '<localleader>ts',
  '<cmd>Neotest stop<CR>',
  { desc = 'stop execution of running tests' }
)

vim.keymap.set(
  'n',
  '<localleader>tc',
  '<cmd>Neotest stop<CR>',
  { desc = 'cancel execution of running tests' }
)

vim.keymap.set(
  'n',
  '<localleader>ts',
  '<cmd>Neotest summary toggle<CR>',
  { desc = 'toggle overview of test tree' }
)

vim.keymap.set('n', '<localleader>tA', function()
  require('neotest').playwright.attachment()
end, { desc = 'open list of attachments of Playwright test case' })

vim.keymap.set(
  'n',
  ']t',
  '<cmd>Neotest jump next<CR>',
  { desc = 'jump to next test case from cursor location' }
)
vim.keymap.set(
  'n',
  '[t',
  '<cmd>Neotest jump prev<CR>',
  { desc = 'jump to previous test case from cursor location' }
)

vim.keymap.set(
  'n',
  ']T',
  '<cmd>Neotest jump next status=failed<CR>',
  { desc = 'jump to next failed test case from cursor location' }
)

vim.keymap.set(
  'n',
  '[T',
  '<cmd>Neotest jump prev status=failed<CR>',
  { desc = 'jump to previous failed test case from cursor location' }
)
