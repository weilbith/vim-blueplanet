augroup Diagnostics
  autocmd!
  autocmd User LspDiagnosticsChanged lua vim.lsp.diagnostic.set_loclist({ open_loclist = false})
  autocmd CursorHold,CursorHoldI * lua vim.lsp.diagnostic.show_line_diagnostics({ show_header = true, border = 'single' })
augroup END
