require('packer').use({ 'mfussenegger/nvim-dap', opt = true })

-- Dependencies
require('packer').use({ 'mxsdev/nvim-dap-vscode-js', opt = true })
require('packer').use({
  'microsoft/vscode-js-debug',
  opt = true,
  tag = 'v1.74.0',
  run = 'npm install --legacy-peer-deps --no-audit && npm run compile',
})
