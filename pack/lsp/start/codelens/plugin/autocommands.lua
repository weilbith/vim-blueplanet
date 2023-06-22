vim.api.nvim_create_augroup('CodeLens', {})
vim.api.nvim_create_autocmd({ 'LspAttach', 'InsertLeave' }, {
  group = 'CodeLens',
  callback = function()
    local supporting_clients = vim.tbl_filter(function(client)
      return client.supports_method('textDocument/codeLens')
    end, vim.lsp.buf_get_clients())

    if #supporting_clients > 0 then
      vim.lsp.codelens.refresh()
    end
  end,
})
