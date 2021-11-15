augroup Diagnostics
  autocmd!
  autocmd User DiagnosticsChanged lua vim.diagnostic.setloclist()
augroup END
