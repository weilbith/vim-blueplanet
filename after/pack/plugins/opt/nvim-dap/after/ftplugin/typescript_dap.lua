require('dap-vscode-js').setup({
  adapters = { 'pwa-node', 'pwa-chrome' },
})

require('dap').configurations[vim.bo[0].ft] = {
  {
    type = 'pwa-node',
    request = 'attach',
    processId = '${command:pickProcess}',
    name = 'Attach Vite development server',
    resolveSourceMapLocations = { '${workspaceFolder}/**', '!**/node_modules/**' },
    cwd = '${workspaceFolder}/src',
    skipFiles = {
      '<node_internals>/**',
      '${workspaceFolder}/node_modules/**/*.js',
      '**/@vite/**',
    },
  },
  {
    type = 'pwa-chrome',
    request = 'launch',
    name = 'Launch to Vite application in Chrome browser',
    url = 'http://localhost:5173',
    webRoot = '${workspaceFolder}/src',
    skipFiles = { '<node_internals>/**', '**/node_modules/**', '**/@vite/**' },
  },
}
