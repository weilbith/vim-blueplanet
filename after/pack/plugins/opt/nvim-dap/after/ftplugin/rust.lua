-- require('dap').adapters.codelldb = function(on_adapter)
--     local stdout = vim.loop.new_pipe(false)
--     local stderr = vim.loop.new_pipe(false)
--
--     -- CHANGE THIS!
--     local cmd = '/home/thore/downloads/extension/adapter/codelldb'
--
--     local handle, pid_or_err
--     local opts = {
--     args = { '--port', '4000' },
--     stdio = { nil, stdout, stderr },
--     detached = true,
--     }
--     handle, pid_or_err = vim.loop.spawn(cmd, opts, function(code)
--         stdout:close()
--         stderr:close()
--         handle:close()
--         if code ~= 0 then
--             print("codelldb exited with code", code)
--         end
--     end)
--     assert(handle, "Error running codelldb: " .. tostring(pid_or_err))
--     vim.schedule(function()
--         on_adapter({
-- type = 'server',
-- host = '127.0.0.1',
-- port = 4000
--         })
--     end)
--     stderr:read_start(function(err, chunk)
--         assert(not err, err)
--         if chunk then
--             vim.schedule(function()
--                 require("dap.repl").append(chunk)
--             end)
--         end
--     end)
-- end

require('dap').adapters.codelldb = {
  type = 'server',
  port = '${port}',
  executable = {
    command = 'codelldb',
    args = { '--port', '${port}' },
  },
}

require('dap').adapters.lldb = {
  type = 'server',
  port = '${port}',
  executable = {
    command = 'codelldb',
    args = { '--port', '${port}' },
  },
}
--                   }

require('dap').configurations.rust = {
  {
    name = 'Launch file',
    type = 'codelldb',
    request = 'launch',
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    cwd = '${workspaceFolder}',
    stopOnEntry = true,
  },
}
