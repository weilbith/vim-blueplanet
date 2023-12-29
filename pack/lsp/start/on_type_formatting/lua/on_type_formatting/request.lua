local encoding = require('on_type_formatting.encoding')

--- @param trigger_character string
--- @return table request_parameter
local function build_request_parameter(trigger_character)
  local parameter = vim.lsp.util.make_formatting_params()
  local position = vim.lsp.util.make_position_params().position
  parameter.position = position
  parameter.ch = encoding.encode_terminal_codes_as_json_escape_sequences(trigger_character)
  return parameter
end

--- LSP response handler for a on-type-formatting request to apply the possibly
--- responded text edits.
---
--- @param result table<table> | nil
--- @param context table
--- @return nil
local function apply_text_edits(_, result, context)
  local text_edits = result or {}
  local client = vim.lsp.get_client_by_id(context.client_id)
  vim.lsp.util.apply_text_edits(text_edits, context.bufnr, client.offset_encoding)
end

--- @param trigger_character string
--- @param client_identifier number
--- @return nil
local function make_request(trigger_character, client_identifier)
  local client = vim.lsp.get_client_by_id(client_identifier)
  local parameter = build_request_parameter(trigger_character)
  client.request('textDocument/onTypeFormatting', parameter, apply_text_edits, 0)
end

--- This schedules a request via the client to request formatting.
--- The deferring ensure that NeoVim updates the cursor position correctly,
--- which is relevant when a key created a new line.
---
--- @param trigger_character string
--- @param client_identifier number
--- @return nil
local function trigger_on_key_formatting(trigger_character, client_identifier)
  vim.defer_fn(function()
    make_request(trigger_character, client_identifier)
  end, 0)
end

return {
  trigger_on_key_formatting = trigger_on_key_formatting,
}
