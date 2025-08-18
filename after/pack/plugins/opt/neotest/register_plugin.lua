require('packer').use({
  'nvim-neotest/neotest',
  requires = {
    { 'nvim-lua/plenary.nvim', opt = true },
    { 'antoinemadec/FixCursorHold.nvim', opt = true },
    { 'nvim-neotest/nvim-nio', opt = true },
    { 'marilari88/neotest-vitest', opt = true },
    { 'rouge8/neotest-rust', opt = true },
    { 'haydenmeade/neotest-jest', opt = true },
    { 'nvim-neotest/neotest-python', opt = true },
    { 'thenbe/neotest-playwright', opt = true },
    { 'nvim-neotest/neotest-go', opt = true },
    { 'weilbith/neotest-gradle', opt = true },
  },
  opt = true,
})
