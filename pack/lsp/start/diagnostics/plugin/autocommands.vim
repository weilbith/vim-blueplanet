augroup Diagnostics
  autocmd!
  autocmd User LspDiagnosticsChanged lua vim.lsp.diagnostic.set_loclist({ open_loclist = false})
augroup END
