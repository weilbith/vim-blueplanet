require('packer').use({
  'windwp/nvim-ts-autotag',
  event = 'InsertEnter',
  config = 'vim.cmd("packadd treesitter-autotag")',
})
