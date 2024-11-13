require('conform').setup({
  formatters_by_ft = {
    lua = { "stylua" },
    typescript = { 'prettierd' },
    typescriptreact = { 'prettierd' },
  }
})
