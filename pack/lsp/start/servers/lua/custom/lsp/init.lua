local get_configuration = require('custom.lsp.configuration').get_configuration
local get_client_response_handlers = require('custom.lsp.middleware').get_client_response_handlers

--- @param file_type string
--- @param custom_configuration table?
local function build_start_options(file_type, custom_configuration)
  local middleware_handler_configuration = {
    handlers = get_client_response_handlers(file_type),
  }

  return vim.tbl_deep_extend(
    'force',
    -- Rank middleware handler configuration highest as it uses a meta-table and
    -- the other configuration might access the handlers too (e.g. `before_init`
    -- hooks)
    middleware_handler_configuration,
    get_configuration(file_type),
    custom_configuration or {}
  )
end

return {
  build_start_options = build_start_options,
}
