local build_start_options = require('custom.lsp').build_start_options

vim.lsp.start(vim.tbl_deep_extend('force', build_start_options(vim.bo[0].ft), {
  name = 'Typst LSP',
  cmd = { 'typst-lsp' },
}))
