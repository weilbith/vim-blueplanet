" Most LSP related mappings are defined in the 'lsp' packages.

nnoremap <unique> <leader>tr <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <unique> <leader>rr <cmd>lua vim.lsp.buf.rename()<CR>
nnoremap <unique> <leader>ra <cmd>lua vim.lsp.buf.code_action()<CR>
