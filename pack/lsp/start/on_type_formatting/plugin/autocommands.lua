local configuration = require('on_type_formatting.configuration')
local key_listening = require('on_type_formatting.key_listening')

local group = vim.api.nvim_create_augroup('Lsp/OnTypeFormatting', {})

vim.api.nvim_create_autocmd('LspAttach', {
  group = group,
  callback = function(event)
    local client_identifier = (event.data or {}).client_id
    configuration.maybe_add_configuration_for_client(client_identifier, event.buf)
    key_listening.maybe_establish_key_listener()
  end,
})

vim.api.nvim_create_autocmd('LspDetach', {
  group = group,
  callback = function(event)
    local client_identifier = (event.data or {}).client_id
    configuration.maybe_remove_configuration_for_client(client_identifier, event.buf)
    key_listening.maybe_remove_key_listener()
  end,
})
