require('packer').use({
  'nvim-neotest/neotest',
  requires = {
    'nvim-lua/plenary.nvim',
    'nvim-treesitter/nvim-treesitter',
    'antoinemadec/FixCursorHold.nvim',
    { 'nvim-neotest/neotest-vim-test', module = 'neotest-vim-test', requires = 'janko/vim-test' },
    { 'marilari88/neotest-vitest', module = 'neotest-vitest' },
    { 'rouge8/neotest-rust', module = 'neotest-rust' },
    { 'haydenmeade/neotest-jest', module = 'neotest-jest' },
    { 'nvim-neotest/neotest-python', module = 'neotest-python' },
    { 'thenbe/neotest-playwright', module = 'neotest-playwright' },
  },
  module = 'neotest',
  cmd = 'Neotest',
  config = 'vim.cmd("packadd neotest_config")',
})
