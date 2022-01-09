packer.use({
  'norcalli/nvim-colorizer.lua',
  event = 'BufRead *',
  config = 'vim.cmd("packadd colorizer | ColorizerReloadAllBuffers")',
})
