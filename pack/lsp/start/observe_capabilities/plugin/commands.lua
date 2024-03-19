local function request_all_supporting_clients(method, parameter)
  local all_clients = vim.lsp.get_clients({ method = method })

  for _, client in ipairs(all_clients) do
    client.request(method, parameter, function(error, result, context)
      local name = vim.lsp.get_client_by_id(context.client_id).name
      print(name)

      print('error', vim.inspect(error))
      print('result', vim.inspect(result))
    end, 0)
  end
end

vim.api.nvim_create_user_command('TestTypeHierarchy', function()
  local method = 'textDocument/prepareTypeHierarchy'
  local parameter = vim.lsp.util.make_position_params()
  request_all_supporting_clients(method, parameter)
  -- TODO: actually request typeHierarchy/supertypes
end, {})

vim.api.nvim_create_user_command('TestLinkedEditingRange', function()
  local method = 'textDocument/linkedEditingRange'
  local parameter = vim.lsp.util.make_position_params()
  request_all_supporting_clients(method, parameter)
end, {})

vim.api.nvim_create_user_command('TestOnTypeFormatting', function()
  local method = 'textDocument/onTypeFormatting'
  local parameter = vim.lsp.util.make_formatting_params()
  local position = vim.lsp.util.make_position_params().position
  local current_line = vim.api.nvim_buf_get_lines(0, position.line, position.line + 1, true)[1]
  local character = current_line:sub(position.character + 1, position.character + 1)
  parameter.position = position
  parameter.ch = character
  print(vim.inspect(parameter))
  request_all_supporting_clients(method, parameter)
end, {})
