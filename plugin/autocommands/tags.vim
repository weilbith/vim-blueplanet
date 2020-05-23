augroup Tags
  autocmd!
  autocmd CursorHold * silent! LspBacomp documentHighlightProvider
        \ silent!\ lua\ vim.lsp.buf.document_highlight()
  autocmd CursorMoved * lua vim.lsp.buf.clear_references()
augroup END
