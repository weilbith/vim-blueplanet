local handle_diagnostics_response = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    underline = false,
    update_in_insert = true,
    virtual_text = { spacing = 8 },
  }
)

local function setup()
  vim.lsp.handlers["textDocument/publishDiagnostics"] = handle_diagnostics_response
end

return {
  setup = setup
}
