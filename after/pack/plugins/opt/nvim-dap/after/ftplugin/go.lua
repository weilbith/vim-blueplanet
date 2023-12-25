require('dap').adapters.delve = {
  type = 'server',
  port = '${port}',
  executable = {
    command = 'dlv',
    args = { 'dap', '--listen', '127.0.0.1:${port}' },
  },
  options = {
    initialize_timeout_sec = 20, -- TODO: Do I need this?
  },
}

require('dap').configurations[vim.bo[0].ft] = {
  {
    name = 'Run Go file',
    type = 'delve',
    request = 'launch',
    program = '${file}',
  },
}
