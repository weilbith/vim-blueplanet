require('packer').use({
  'nvim-neo-tree/neo-tree.nvim',
  requires = {
    { 'nvim-lua/plenary.nvim', opt = true },
    { 'kyazdani42/nvim-web-devicons', opt = true },
    { 'MunifTanjim/nui.nvim', opt = true },
    { 'antosha417/nvim-lsp-file-operations', opt = true },
  },
  opt = true,
})
