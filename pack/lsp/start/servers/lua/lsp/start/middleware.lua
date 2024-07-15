local ALL_FILE_TYPES = 'all-file-types'

--- @class HandlerWithPriority
--- @field handler function
--- @field priority number

--- @type table<string, table<string, HandlerWithPriority[]>>
local storage = {}

--- @param method_name string
--- @return boolean
local function is_valid_method_name(method_name)
  return vim.tbl_contains(vim.lsp.protocol.Methods, method_name)
end

--- @param method_name string - protocol method to add handler for
--- @param handler function - handler to add on middleware stack for this method
--- @param priority number? - used to sort handlers in the middleware stack on execution
--- @param file_type string? - apply configuration for this file type only, all by default
---
--- A middleware handle function must return a list of values:
---   - A boolean value that decided if the client should continue processing the
---     servers response down the middleware stack.
---   - The server response properties in the order of error, response, context,
---     configuration. This can be used to manipulate the response for the next
---     middleware handler in the stack.
local function add_middleware(method_name, handler, priority, file_type)
  if not is_valid_method_name(method_name) then
    error('Can not set LSP middleware for unknown method name: ' .. method_name)
  end

  vim.validate({ handler = { handler, 'f', false } })

  file_type = file_type or ALL_FILE_TYPES
  priority = priority or 1

  if storage[file_type] == nil then
    storage[file_type] = {}
  end

  local handler_list = storage[file_type][method_name] or {}
  local handler_entry = { handler = handler, priority = priority }
  table.insert(handler_list, handler_entry)
  storage[file_type][method_name] = handler_list
end

--- @param method_name string - protocol method add handler for
--- @param file_type string - apply configuration for this file type only
--- @return table[function]
---
--- Collects all handler functions for the specified method and sorts them based
--- on their priority, with highest priority first. Merges handlers registered
--- for all file types with those for the specified one.
local function get_middleware_stack(method_name, file_type)
  local all_filetype_handlers = (storage[ALL_FILE_TYPES] or {})[method_name] or {}
  local language_specific_handlers = (storage[file_type] or {})[method_name] or {}

  local all_handlers = vim.list_extend(all_filetype_handlers, language_specific_handlers)
  table.sort(all_handlers, function(a, b)
    return a.priority > b.priority
  end)

  local middleware_stack = vim.tbl_map(function(entry)
    return entry.handler
  end, all_handlers)

  return middleware_stack
end

--- @param method_name string - protocol method to get handler for
--- @param file_type string - apply configuration for this file type only
local function get_client_response_handler_for_method(method_name, file_type)
  local middleware_stack = get_middleware_stack(method_name, file_type)

  if #middleware_stack == 0 then
    return nil
  end

  return function(error, result, context, configuration)
    local continue = true

    for _, next_handler in ipairs(middleware_stack) do
      if continue then
        continue, error, result, context, configuration = next_handler(
          error,
          result,
          context,
          configuration
        )
      end
    end

    local default_handler = vim.lsp.handlers[method_name]

    -- Always call default handler if exists, because the "special" return
    -- values matter to NeoVim.
    if default_handler ~= nil then
      return default_handler(error, result, context, configuration)
    end
  end
end

--- @param file_type string - apply configuration for this file type only
local function get_client_response_handlers(file_type)
  return setmetatable({}, {
    __index = function(_, method_name)
      return get_client_response_handler_for_method(method_name, file_type)
    end,
  })
end

return {
  add_middleware = add_middleware,
  get_middleware_stack = get_middleware_stack,
  get_client_response_handlers = get_client_response_handlers,
}
