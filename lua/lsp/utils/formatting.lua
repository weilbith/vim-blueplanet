local function doesAnyClientSupportFormatting()
  for _, client in ipairs(vim.lsp.buf_get_clients()) do
    if client.resolved_capabilities.document_formatting then
      return true
    end
  end

  return false
end

local function formatBufferIfPossible()
  if doesAnyClientSupportFormatting() then
    vim.lsp.buf.formatting({})
  else
    print("No formatting available") -- As indicator to add support
  end
end

return {
  formatBufferIfPossible = formatBufferIfPossible
}
