require('packer').use({
  't9md/vim-choosewin',
  setup = function()
    vim.g.choosewin_overlay_enable = 1
  end,
  opt = true,
})
