local function doesAnyClientSupportFormatting()
  for _, client in ipairs(vim.lsp.buf_get_clients()) do
    if client.supports_method('textDocument/formatting') then
      return true
    end
  end

  return false
end

local function formattingIsDisabledByUser()
  return vim.b.formatting_disabled or vim.g.formatting_disabled or false
end

local function formatBufferIfPossible()
  if doesAnyClientSupportFormatting() then
    if not formattingIsDisabledByUser() then
      vim.lsp.buf.format({
        async = true,
        filter = function(client)
          return client.name ~= 'kotlin_language_server'
        end,
      })
    end
  end
end

return {
  formatBufferIfPossible = formatBufferIfPossible,
}
