require('packer').use({
  'nvim-neo-tree/neo-tree.nvim',
  branch = 'v2.x',
  requires = {
    'nvim-lua/plenary.nvim',
    { 'kyazdani42/nvim-web-devicons', module = 'nvim-web-devicons' },
    { 'MunifTanjim/nui.nvim', module = 'nui' },
  },
  cmd = 'Neotree',
})
