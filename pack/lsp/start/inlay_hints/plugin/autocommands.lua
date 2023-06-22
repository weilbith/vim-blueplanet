local group_identifier = vim.api.nvim_create_augroup('InlayHints', {})

vim.api.nvim_create_autocmd({ 'LspAttach', 'LspDetach' }, {
  group = group_identifier,
  callback = function(arguments)
    local buffer_number = arguments.buf
    local clients = vim.lsp.get_active_clients({ bufnr = buffer_number })

    local clients_with_support = vim.tbl_filter(function(client)
      return client.supports_method('textDocument/inlayHint')
    end, clients)

    local enable = #clients_with_support > 0
    vim.lsp.buf.inlay_hint(buffer_number, enable)
  end,
})
