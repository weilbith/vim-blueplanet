require('packer').use({
  'weilbith/vim-qfloc-edit',
  setup = function()
    vim.g.qfloc_edit_disable_mappings = true
  end,
  opt = true,
})
