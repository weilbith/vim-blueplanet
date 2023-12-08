vim.api.nvim_create_augroup('DocumentColor', {})
vim.api.nvim_create_autocmd('LspAttach', {
  group = 'DocumentColor',
  callback = function(arguments)
    local client_identifier = (arguments.data or {}).client_id
    local client = vim.lsp.get_client_by_id(client_identifier)

    if client and client.server_capabilities.colorProvider then
      local buffer_number = arguments.buf
      require('document-color').buf_attach(buffer_number)
    end
  end,
})
