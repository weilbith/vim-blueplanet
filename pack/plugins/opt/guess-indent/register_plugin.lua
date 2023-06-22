require('packer').use({
  'NMAC427/guess-indent.nvim',
  config = function()
    vim.cmd.packadd('guess-indent')
  end,
})
