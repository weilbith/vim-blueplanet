vim.cmd.packadd('nvim-dap-vscode-js')

require('dap-vscode-js').setup({
  adapters = { 'pwa-node', 'pwa-chrome' },
})

-- TODO: fix registration
require('dap').configurations[vim.bo[0].ft] = {
  {
    type = 'pwa-node',
    request = 'attach',
    processId = '${command:pickProcess}',
    name = 'Attach to a node process in debug mode',
    resolveSourceMapLocations = { '${workspaceFolder}/**', '!**/node_modules/**' },
    skipFiles = {
      '<node_internals>/**',
      '${workspaceFolder}/node_modules/**/*.js',
      '**/@vite/**', -- for Vite related projects obviously...
    },
  },
  {
    type = 'pwa-chrome',
    request = 'launch',
    name = 'Launch web application in Chrome web browser',
    url = function()
      return vim.fn.input({ prompt = 'URL: ', default = 'http://localhost:5173' })
    end,
    webRoot = function()
      local folder = vim.fn.input({
        prompt = 'Source Folder ',
        default = 'src',
        completion = 'dir',
      })
      return '${workspaceFolder}/' .. folder
    end,
    skipFiles = { '<node_internals>/**', '**/node_modules/**', '**/@vite/**' },
  },
}
