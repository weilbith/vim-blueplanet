packer.use({
  'kosayoda/nvim-lightbulb',
  event = { 'CursorHold', 'CursorHoldI' },
  config = 'vim.cmd("packadd lightbulb")',
})
