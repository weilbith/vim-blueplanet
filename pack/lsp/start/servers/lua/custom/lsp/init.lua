local get_configuration = require('custom.lsp.configuration').get_configuration
local get_client_response_handlers = require('custom.lsp.middleware').get_client_response_handlers

--- @param file_type string
local function build_start_options(file_type)
  return vim.tbl_deep_extend('force', get_configuration(file_type), {
    handlers = get_client_response_handlers(file_type),
  })
end

return {
  build_start_options = build_start_options,
}
