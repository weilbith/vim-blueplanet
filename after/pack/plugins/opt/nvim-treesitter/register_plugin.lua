require('packer').use({
  'nvim-treesitter/nvim-treesitter',
  run = function()
    vim.cmd('TSUpdate')
  end,
})
