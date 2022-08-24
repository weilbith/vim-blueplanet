vim.api.nvim_create_augroup('lsp_inlayhints', {})
vim.api.nvim_create_autocmd('LspAttach', {
  group = 'lsp_inlayhints',
  callback = function(arguments)
    if not (arguments.data and arguments.data.client_id) then
      return
    end

    local buffer_number = arguments.buf
    local client = vim.lsp.get_client_by_id(arguments.data.client_id)

    require('lsp-inlayhints').on_attach(client, buffer_number)
  end,
})
