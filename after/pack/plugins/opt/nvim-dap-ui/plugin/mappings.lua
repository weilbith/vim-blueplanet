local dap_ui = require('dapui')

vim.keymap.set(
  'n',
  '<leader>de',
  dap_ui.eval,
  { desc = 'evaluate expression under cursor by debugger and show result in pop-up window' }
)

vim.keymap.set(
  'n',
  '<leader>dQ',
  dap_ui.close,
  { desc = 'close interface viewing the debugger session' }
)
