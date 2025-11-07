require('packer').use({
  'nvim-treesitter/nvim-treesitter',
  branch = 'main',
  run = function()
    vim.cmd('TSUpdate')
  end,
})
