require('packer').use({
  'nvim-treesitter/playground',
  cmd = 'TSHighlightCapturesUnderCursor',
  config = 'vim.cmd("packadd treesitter-playground")',
})
