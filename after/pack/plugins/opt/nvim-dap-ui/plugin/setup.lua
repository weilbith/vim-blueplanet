vim.cmd.packadd('nvim-nio')

require('dapui').setup()

local dap = require('dap')
local dap_ui = require('dapui')
local plugin_name = 'dapui'

dap.listeners.after.event_initialized[plugin_name] = function()
  dap_ui.open()
end

dap.listeners.before.event_exited[plugin_name] = function()
  dap_ui.close()
end
