local group = vim.api.nvim_create_augroup('CodeLens', {})

vim.api.nvim_create_autocmd({ 'LspAttach', 'InsertLeave' }, {
  group = group,
  callback = function(arguments)
    local supporting_clients = vim.tbl_filter(function(client)
      return client.supports_method('textDocument/codeLens')
    end, vim.lsp.get_clients({ bufnr = arguments.buf }))

    if #supporting_clients > 0 then
      vim.lsp.codelens.refresh({ bufnr = arguments.buf })
    end
  end,
})
