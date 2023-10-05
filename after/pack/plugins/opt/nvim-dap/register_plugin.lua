require('packer').use({
  'mfussenegger/nvim-dap',
  requires = {
    'mxsdev/nvim-dap-vscode-js',
    module = 'dap-vscode-js',
    requires = {
      'microsoft/vscode-js-debug',
      opt = true,
      tag = 'v1.74.0',
      run = 'npm install --legacy-peer-deps --no-audit && npm run compile',
    },
  },
  module = 'dap',
})
