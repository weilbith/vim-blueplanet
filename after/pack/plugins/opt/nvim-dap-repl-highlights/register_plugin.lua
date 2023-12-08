require('packer').use({
  'LiadOz/nvim-dap-repl-highlights',
  requires = 'nvim-treesitter/nvim-treesitter',
  ft = 'dap-repl',
  run = function()
    require('nvim-dap-repl-highlights').setup()
    vim.cmd('TSInstall dap_repl')
  end,
})
