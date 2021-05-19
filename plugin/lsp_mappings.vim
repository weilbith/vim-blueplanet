" Most LSP related mappings are defined in the 'lsp' packages.

nnoremap <leader>tr	<cmd>lua vim.lsp.buf.references()<CR>
nnoremap <leader>rr	<cmd>lua vim.lsp.buf.rename()<CR>
nnoremap <leader>ra	<cmd>lua vim.lsp.buf.code_action()<CR>
