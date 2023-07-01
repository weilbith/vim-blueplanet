local null_ls = require('null-ls')

local symbol_kind_number_to_name = {
  [1] = 'File',
  [2] = 'Module',
  [3] = 'Namespace',
  [4] = 'Package',
  [5] = 'Class',
  [6] = 'Method',
  [7] = 'Property',
  [8] = 'Field',
  [9] = 'Constructor',
  [10] = 'Enum',
  [11] = 'Interface',
  [12] = 'Function',
  [13] = 'Variable',
  [14] = 'Constant',
  [15] = 'String',
  [16] = 'Number',
  [17] = 'Boolean',
  [18] = 'Array',
  [19] = 'Object',
  [20] = 'Key',
  [21] = 'Null',
  [22] = 'EnumMember',
  [23] = 'Struct',
  [24] = 'Event',
  [25] = 'Operator',
  [26] = 'TypeParameter',
}

local function any_server_has_all_capabilities(capability_names)
  local clients = vim.lsp.buf_get_clients()
  local any_server_has_support = false

  for _, client in pairs(clients) do
    for _, capability in pairs(capability_names) do
      -- TODO: use client supports method?
      if not client.server_capabilities[capability] then
        goto continue
      end
    end

    -- TODO: Why can't we `break` or `return` early here?
    any_server_has_support = true
    ::continue::
  end

  return any_server_has_support
end

local function get_symbol_trees(buffer_number, document_uri)
  local all_client_responses = vim.lsp.buf_request_sync(
    buffer_number,
    'textDocument/documentSymbol',
    { textDocument = { uri = document_uri } }
  )

  local all_symbol_trees = {}

  for client_id, response in pairs(all_client_responses or {}) do
    -- TODO: Log errors?
    local symbol_trees = response.result or {}

    vim.tbl_map(function(symbol)
      symbol.client_id = client_id
      return symbol
    end, symbol_trees)

    vim.list_extend(all_symbol_trees, symbol_trees)
  end

  return all_symbol_trees
end

-- TODO: Add max depth
local function get_flatten_symbol_tree(symbol_tree, max_depth, depth)
  if depth == nil then
    depth = 0
  end

  if max_depth > 0 and depth >= max_depth then
    return {}
  end

  local child_trees = symbol_tree.children or {}

  vim.tbl_map(function(child)
    child.client_id = symbol_tree.client_id
    return child
  end, child_trees)

  local symbol = symbol_tree
  symbol.children = nil

  local all_symbols = { symbol }

  for _, child in pairs(child_trees) do
    local child_symbols = get_flatten_symbol_tree(child, max_depth, depth + 1)
    vim.list_extend(all_symbols, child_symbols)
  end

  return all_symbols
end

local function get_all_symbols_from_trees(symbol_trees, max_depth)
  local all_symbols = {}

  for _, symbol_tree in pairs(symbol_trees or {}) do
    local symbols = get_flatten_symbol_tree(symbol_tree, max_depth)
    vim.list_extend(all_symbols, symbols)
  end

  return all_symbols
end

local function filter_symbols_by_type(symbols, allowed_kinds)
  if allowed_kinds == nil or #allowed_kinds == 0 then
    return symbols
  end

  return vim.tbl_filter(function(symbol)
    local kind = symbol_kind_number_to_name[symbol.kind]
    return vim.tbl_contains(allowed_kinds, kind)
  end, symbols)
end

local function enrich_symbols_with_metadata(symbols, document_uri, buffer_number)
  vim.tbl_map(function(symbol)
    symbol.document_uri = document_uri
    symbol.buffer_number = buffer_number
  end,
    symbols
  )

  return symbols
end

local function get_range_of_symbol(symbol)
  return symbol.selectionRange or symbol.range or symbol.location.range
end

local function get_single_line_range_of_symbol(symbol)
  local range = get_range_of_symbol(symbol)

  if range.start.line ~= range['end'].line then
    range['end'] = { line = range.start.line, character = range.start.character + 1 }
  end

  return range
end

local function get_reference_counts_of_symbol(symbol)
  local client = vim.lsp.get_client_by_id(symbol.client_id)

  if not client then return nil end

  local range = get_range_of_symbol(symbol)
  local parameters = {
    textDocument = { uri = symbol.document_uri },
    position = range.start,
    context = {
      includeDeclaration = false
    }
  }

  local response = client.request_sync(
    'textDocument/references',
    parameters,
    nil,
    symbol.buffer_number
  )

  if response and response.result then
    local external_references = vim.tbl_filter(function(reference)
      return reference.uri ~= symbol.document_uri
    end,
      response.result
    )

    return { total = #response.result, external = #external_references }
  end

end

local function get_references_per_symbol(symbols)
  local references = {}

  for index, symbol in ipairs(symbols) do
    local client = vim.lsp.get_client_by_id(symbol.client_id)
    local range = get_range_of_symbol(symbol)
    local parameters = {
      textDocument = { uri = symbol.document_uri },
      position = range.start,
      context = {
        includeDeclaration = false
      }
    }

    client.request('textDocument/references', parameters, function(_, result)
      references[index] = result or {}
    end, symbol.buffer_number
    )
  end

  -- TODO: Timeout handling...
  vim.wait(5000, function() return #references == #symbols end, 500)

  return references
end

local function show_references(symbol)
  vim.notify(vim.inspect(symbol), vim.log.levels.WARN)
end

local function create_lens(symbol, references, unknown_count_icon)
  local range = get_single_line_range_of_symbol(symbol)
  local title = (#references or unknown_count_icon) .. ' References'
  local command = { title = title }

  local action = function()
    show_references(symbol)
  end

  return { range = range, command = command, action = action }
end

local function create_lenses(symbols, references, unknown_count_icon)
  local lenses = {}

  for index, symbol in ipairs(symbols) do
    local symbol_references = references[index]
    local lens = create_lens(symbol, symbol_references, unknown_count_icon)
    table.insert(lenses, lens)
  end

  return lenses
end

local function get_reference_lenses(request_parameters)
  if not any_server_has_all_capabilities({ 'documentSymbolProvider', 'referencesProvider' }) then
    return {}
  end

  local buffer_number = request_parameters.bufnr
  local document_uri = request_parameters.lsp_params.textDocument.uri
  local symbol_trees = get_symbol_trees(buffer_number, document_uri)
  local symbols = get_all_symbols_from_trees(symbol_trees, -1) -- TODO: Configuration
  symbols = enrich_symbols_with_metadata(symbols, document_uri, buffer_number)
  symbols = filter_symbols_by_type(symbols,
    { 'Function', 'Constant', 'Class', 'Method', 'Enum', 'Field', 'EnumMember', 'Object' }) -- TODO: Configuration
  local references = get_references_per_symbol(symbols)
  -- TODO: Is it necessary to merge symbols from clients?
  -- TODO: How does it look for multiple symbols in same line?
  local lenses = create_lenses(symbols, references, "") -- TODO: Configuration
  return lenses
end

return {
  name = 'Foo Lens',
  meta = {
    description = 'Testing code lens support',
  },
  method = null_ls.methods.CODE_LENS,
  filetypes = {},
  generator = {
    fn = function(request_parameters, done)
      local lenses = get_reference_lenses(request_parameters)
      done(lenses)
    end,
    async = true
  },
}
