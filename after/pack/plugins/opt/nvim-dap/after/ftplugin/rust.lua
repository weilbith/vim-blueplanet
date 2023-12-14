require('dap').adapters.codelldb = {
  type = 'server',
  port = '${port}',
  executable = {
    command = 'codelldb',
    args = { '--port', '${port}' },
  },
}

require('dap').configurations[vim.bo[0].ft] = {
  {
    name = 'Launch file',
    type = 'codelldb',
    request = 'launch',
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    project_root = '${workspaceFolder}',
    stopOnEntry = true,
    sourceLanguages = { 'rust' },
  },
}
