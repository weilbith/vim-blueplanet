require('packer').use({
  'Pocco81/true-zen.nvim',
  cmd = { 'TZFocus', 'TZAtaraxis' },
  config = 'vim.cmd("packadd true-zen")',
})
