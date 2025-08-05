return function()
  require('lsp.start')({
    name = 'Nushell Language Server',
    cmd = { 'nu', '--lsp' },
  })
end
