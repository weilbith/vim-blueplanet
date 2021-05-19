local handle_hover_response = vim.lsp.with(
  vim.lsp.handlers.hover, {
    border = "single",
  }
)

local function setup()
  vim.lsp.handlers["textDocument/hover"] = handle_hover_response
end

return {
  setup = setup
}
