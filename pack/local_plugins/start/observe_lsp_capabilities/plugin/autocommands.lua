local group = vim.api.nvim_create_augroup('ObserveFeatures', {})
vim.api.nvim_create_autocmd('LspAttach', {
  group = group,
  callback = function(arguments)
    local client_identifier = (arguments.data or {}).client_id
    local client = vim.lsp.get_client_by_id(client_identifier)
    local capabilities = (client or {}).server_capabilities or {}
    local feature_list = {}

    if capabilities.typeHierarchyProvider then
      table.insert(feature_list, 'typeHierarchy')
    end

    if capabilities.linkedEditingRangeProvider then
      table.insert(feature_list, 'linkedEditingRange')
    end

    if capabilities.documentOnTypeFormattingProvider then
      local first_trigger = capabilities.documentOnTypeFormattingProvider.firstTriggerCharacter
      local more_trigger = capabilities.documentOnTypeFormattingProvider.moreTriggerCharacter
      table.insert(
        feature_list,
        'onTypeFormatting on "' .. first_trigger .. '" and ' .. vim.inspect(more_trigger)
      )
    end

    if capabilities.inlineCompletionProvider then
      table.insert(feature_list, 'inlineCompletion')
      print('LSP inlineCompletion is supported')
    end

    -- if #feature_list > 0 then
    --   local message = client.name .. ' supports: \n- ' .. table.concat(feature_list, '\n- ')
    --
    --   vim.notify_once(message, vim.log.levels.INFO)
    -- end
  end,
})

vim.api.nvim_create_autocmd('LspAttach', {
  group = group,
  callback = function(arguments)
    local client_identifier = (arguments.data or {}).client_id
    local client = vim.lsp.get_client_by_id(client_identifier)

    if client ~= nil and client.server_capabilities.documentLinkProvider then
      local method = 'textDocument/documentLink'
      local parameter = { textDocument = vim.lsp.util.make_text_document_params(0) }
      local response = client:request_sync(method, parameter)
      local result = (response or {}).result or {}

      if #result > 0 then
        vim.notify('#' .. #result .. ' document links by ' .. client.name)
        print('Document Links:')
        print(vim.inspect(result))
      end
    end
  end,
})
