require('packer').use({
  't9md/vim-choosewin',
  cmd = { 'ChooseWin', 'ChooseWinSwap', 'ChooseWinSwapStay' },
  setup = 'vim.cmd("packadd choosewin")',
})
