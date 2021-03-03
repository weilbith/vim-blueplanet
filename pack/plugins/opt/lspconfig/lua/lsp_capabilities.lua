-- TODO: Also this works, it is pretty ugly and unspecific. Improve!
local function construct_custom_capabilities(custom_properties)
  local custom_properties = custom_properties or {}
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities.textDocument.completion.completionItem.snippetSupport = custom_properties.snippetSupport or false
  return capabilities
end

return {
  construct_custom_capabilities = construct_custom_capabilities
}
