local group = vim.api.nvim_create_augroup('Lsp/OnTypeFormatting', {})

vim.api.nvim_create_autocmd('LspAttach', {
  group = group,
  callback = function(event)
    local client_identifier = (event.data or {}).client_id

    if client_identifier ~= nil then
      require('on_type_formatting.configuration').add_configuration_for_client(
        client_identifier,
        event.buf
      )
      require('on_type_formatting.key_listening').register_the_key_listener_if_needed()
    end
  end,
  desc = 'Registers or extends LSP on-type-formatting for buffer if attached client supports it.',
})

vim.api.nvim_create_autocmd('LspDetach', {
  group = group,
  callback = function(event)
    local client_identifier = (event.data or {}).client_id

    if client_identifier ~= nil then
      require('on_type_formatting.configuration').remove_configuration_for_client(
        client_identifier,
        event.buf
      )
      require('on_type_formatting.key_listening').unregister_the_key_listener_if_needless()
    end
  end,
  desc = 'Unregisters LSP on-type-formatting for detached client of the buffer.',
})
