augroup Tags
  autocmd!
  autocmd CursorHold <buffer> lua require'custom.lsp.highlight_utils'.highlight_if_available()
  autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
augroup END
