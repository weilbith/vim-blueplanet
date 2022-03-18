local function doesAnyClientSupportFormatting()
  for _, client in ipairs(vim.lsp.buf_get_clients()) do
    if client.resolved_capabilities.document_formatting then
      return true
    end
  end

  return false
end

local function formattingIsDisabledByUser()
  return vim.b.formatting_disabled or false
end

local function handle_format_response(error, result, context)
  if result == nil then
    return
  end

  if error ~= nil then
    vim.api.nvim_notify('Formatting has failed!', 4, {})
    return
  end

  local buffer_number = context.bufnr
  local buffer_modified = vim.api.nvim_buf_get_option(buffer_number, 'modified')

  if not buffer_modified then
    local preserved_view = vim.fn.winsaveview()
    vim.lsp.util.apply_text_edits(result, buffer_number)
    vim.fn.winrestview(preserved_view)
  end
end

local function setup()
  vim.lsp.handlers['textDocument/formatting'] = handle_format_response
end

local function formatBufferIfPossible()
  if doesAnyClientSupportFormatting() then
    if not formattingIsDisabledByUser() then
      vim.lsp.buf.formatting_seq_sync()
    end
  end
end

return {
  setup = setup,
  formatBufferIfPossible = formatBufferIfPossible,
}
