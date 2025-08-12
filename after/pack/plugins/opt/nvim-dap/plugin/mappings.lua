local dap = require('dap')

vim.keymap.set('n', '<leader>dc', dap.continue, { desc = 'continue debugging' })

vim.keymap.set('n', '<leader>dC', dap.run_last, { desc = 're-run last debug session again' })

vim.keymap.set('n', '<leader>di', function()
  dap.step_into({ askForTargets = true })
end, { desc = 'step into debug target' })

vim.keymap.set('n', '<leader>do', function()
  dap.step_out({ askForTargets = true })
end, { desc = 'step out of debug target' })

vim.keymap.set('n', '<leader>dn', function()
  dap.step_over({ askForTargets = true })
end, { desc = 'step over debug target - "next instruction"' })

vim.keymap.set(
  'n',
  '<leader>dN',
  dap.step_back,
  { desc = 'step back of debug target - "previous instruction"' }
)

vim.keymap.set(
  'n',
  '<leader>dg',
  dap.run_to_cursor,
  { desc = 'execute all steps till ("goto") cursor location' }
)

vim.keymap.set('n', '<leader>dq', dap.disconnect, { desc = 'quick debugging sessions' })
