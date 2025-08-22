--- @param trigger_character string as JSON escape sequence
--- @return table request_parameters
local function build_request_parameters(trigger_character)
  local parameters = vim.lsp.util.make_formatting_params()
  parameters.position = vim.lsp.util.make_position_params().position
  parameters.ch = trigger_character
  return parameters
end

--- @param result table<table> | nil
--- @param context table
--- @return nil
local function apply_text_edits_of_response(_, result, context)
  local text_edits = result or {}
  print('text edits', #text_edits)
  local client = vim.lsp.get_client_by_id(context.client_id)
  vim.lsp.util.apply_text_edits(text_edits, context.bufnr, client.offset_encoding)
end

--- @param trigger_character string as JSON escape sequence
--- @param client_identifier number
--- @return nil
local function send_request_to_server(trigger_character, client_identifier)
  local client = vim.lsp.get_client_by_id(client_identifier)
  local parameters = build_request_parameters(trigger_character)
  client:request('textDocument/onTypeFormatting', parameters, apply_text_edits_of_response, 0)
end

--- This schedules a request via the client to request formatting.
--- The deferring ensure that NeoVim updates the cursor position correctly,
--- which is relevant when a key created a new line for example.
---
--- @param trigger_character string as JSON escape sequence
--- @param client_identifier number
--- @return nil
local function request_formatting(trigger_character, client_identifier)
  vim.defer_fn(function()
    send_request_to_server(trigger_character, client_identifier)
  end, 0)
end

return {
  request_formatting = request_formatting,
}
