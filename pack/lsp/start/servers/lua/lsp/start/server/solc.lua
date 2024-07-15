require("lsp.start")({
  name = 'Solidity Compiler - Language Server',
  cmd = { 'solc', '--lsp' },
})
