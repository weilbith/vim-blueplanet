require('packer').use({
  'nvim-neotest/neotest',
  requires = {
    'nvim-lua/plenary.nvim',
    'antoinemadec/FixCursorHold.nvim',
    { 'marilari88/neotest-vitest', module = 'neotest-vitest' },
    { 'rouge8/neotest-rust', module = 'neotest-rust' },
    { 'haydenmeade/neotest-jest', module = 'neotest-jest' },
    { 'nvim-neotest/neotest-python', module = 'neotest-python' },
    { 'thenbe/neotest-playwright', module = 'neotest-playwright' },
    { 'nvim-neotest/neotest-go', module = 'neotest-go' },
    { 'weilbith/neotest-gradle', module = 'neotest-gradle' },
  },
  module = 'neotest',
  cmd = 'Neotest',
})
