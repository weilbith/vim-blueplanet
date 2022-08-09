vim.api.nvim_create_augroup('CodeLens', {})
vim.api.nvim_create_autocmd({ 'LspAttach', 'InsertLeave' }, {
  group = 'CodeLens',
  callback = function()
    local clients = vim.lsp.buf_get_clients()
    local any_client_has_support = false

    for _, client in pairs(clients) do
      if client.server_capabilities.codeLensProvider then
        any_client_has_support = true
        break
      end
    end

    if any_client_has_support then
      vim.lsp.codelens.refresh()
    end
  end,
})
