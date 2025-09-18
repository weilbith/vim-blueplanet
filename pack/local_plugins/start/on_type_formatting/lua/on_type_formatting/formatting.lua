--- @class DocumentOnTypeFormattingParams : lsp.DocumentFormattingParams
--- @field textDocument lsp.TextDocumentIdentifier
--- @field position lsp.Position
--- @field ch string
--- @field options lsp.FormattingOptions

--- @param trigger_character string as JSON escape sequence
--- @return DocumentOnTypeFormattingParams request_parameters
local function build_request_parameters(trigger_character, position_encoding)
  local formatting_parameters = vim.lsp.util.make_formatting_params()
  local position_parameters = vim.lsp.util.make_position_params(0, position_encoding)

  return {
    textDocument = formatting_parameters.textDocument,
    position = position_parameters.position,
    ch = trigger_character,
    options = formatting_parameters.options,
  }
end

--- @param result lsp.TextEdit[]?
--- @param context lsp.HandlerContext
--- @return nil
local function apply_text_edits_of_response(_, result, context)
  local text_edits = result or {}
  print('text edits', #text_edits)
  local client = vim.lsp.get_client_by_id(context.client_id)
  assert(client)
  vim.lsp.util.apply_text_edits(text_edits, context.bufnr, client.offset_encoding)
end

--- @param trigger_character string as JSON escape sequence
--- @param client_identifier integer
--- @return nil
local function send_request_to_server(trigger_character, client_identifier)
  local client = vim.lsp.get_client_by_id(client_identifier)
  assert(client)
  local parameters = build_request_parameters(trigger_character, client.offset_encoding)
  client:request('textDocument/onTypeFormatting', parameters, apply_text_edits_of_response, 0)
end

--- This schedules a request via the client to request formatting.
--- The deferring ensure that NeoVim updates the cursor position correctly,
--- which is relevant when a key created a new line for example.
---
--- @param trigger_character string as JSON escape sequence
--- @param client_identifier integer
--- @return nil
local function request_formatting(trigger_character, client_identifier)
  vim.defer_fn(function()
    send_request_to_server(trigger_character, client_identifier)
  end, 0)
end

return {
  request_formatting = request_formatting,
}
