require('packer').use({
  'kyazdani42/nvim-tree.lua',
  requires = 'kyazdani42/nvim-web-devicons',
  cmd = { 'NvimTreeToggle', 'NvimTreeFindFile' },
  config = 'vim.cmd("packadd tree")',
})
