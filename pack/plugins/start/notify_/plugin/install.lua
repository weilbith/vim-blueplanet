require('packer').use({
  'rcarriga/nvim-notify',
  event = 'VimEnter', -- Else the highlights do not work...
  config = 'vim.cmd("packadd notify")',
})
