require('packer').use({
  'nvim-neo-tree/neo-tree.nvim',
  requires = {
    'nvim-lua/plenary.nvim',
    { 'kyazdani42/nvim-web-devicons', module = 'nvim-web-devicons' },
    { 'MunifTanjim/nui.nvim', module = 'nui' },
    { 'antosha417/nvim-lsp-file-operations', module = 'lsp-file-operations' },
  },
  cmd = 'Neotree',
})
