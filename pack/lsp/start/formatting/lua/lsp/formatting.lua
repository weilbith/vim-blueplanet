local function doesAnyClientSupportFormatting()
  local clients_with_support = vim.lsp.get_clients({ bufnr = 0, method = 'textDocument/inlayHint' })

  return #clients_with_support > 0
end

local function formattingIsDisabledByUser()
  return vim.b.formatting_disabled or vim.g.formatting_disabled or false
end

local function formatBufferIfPossible()
  if doesAnyClientSupportFormatting() and not formattingIsDisabledByUser() then
    vim.lsp.buf.format({
      async = true,
      filter = function(client)
        return client.name ~= 'kotlin_language_server'
      end,
    })
  end
end

return {
  formatBufferIfPossible = formatBufferIfPossible,
}
