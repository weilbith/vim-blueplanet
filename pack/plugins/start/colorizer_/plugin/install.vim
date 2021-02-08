lua packer.use({
      \   'norcalli/nvim-colorizer.lua',
      \   event = 'BufReadPost *',
      \   config = 'vim.cmd("packadd colorizer | ColorizerReloadAllBuffers")',
      \ })
