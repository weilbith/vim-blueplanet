require('packer').use({
  'mfussenegger/nvim-dap',
  opt = true,
  requires = {
    'mxsdev/nvim-dap-vscode-js',
    opt = true,
    requires = {
      'microsoft/vscode-js-debug',
      opt = true,
      tag = 'v1.74.0',
      run = 'npm install --legacy-peer-deps --no-audit && npm run compile',
    },
  },
})
