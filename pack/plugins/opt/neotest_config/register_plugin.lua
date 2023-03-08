require('packer').use({
  'nvim-neotest/neotest',
  requires = {
    'nvim-lua/plenary.nvim',
    'nvim-treesitter/nvim-treesitter',
    'antoinemadec/FixCursorHold.nvim',
    { 'nvim-neotest/neotest-vim-test', module = 'neotest-vim-test', requires = 'janko/vim-test' },
    { 'marilari88/neotest-vitest', module = 'neotest-vitest' },
    { 'MarkEmmons/neotest-rust', module = 'neotest-rust', branch = 'feature/dap-support' },
    { 'haydenmeade/neotest-jest', module = 'neotest-jest' },
    { 'nvim-neotest/neotest-python', module = 'neotest-python' },
  },
  module = 'neotest',
  config = 'vim.cmd("packadd neotest_config")',
})
