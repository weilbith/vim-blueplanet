--- @type vim.lsp.Config
return {
  cmd = { 'solc', '--lsp' },
  filetypes = { 'solidity' },
  root_markers = { '.git' },
}
