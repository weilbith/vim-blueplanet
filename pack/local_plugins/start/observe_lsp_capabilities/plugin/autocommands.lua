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

    if capabilities.inlineCompletionProvider then
      table.insert(feature_list, 'inlineCompletion')
    end

    local client_name = vim.tbl_get(client or {}, 'name') or 'unknown client'

    if #feature_list > 0 then
      local message = client_name .. ' supports: \n- ' .. table.concat(feature_list, '\n- ')

      vim.notify_once(message, vim.log.levels.INFO)
    end
  end,
})
