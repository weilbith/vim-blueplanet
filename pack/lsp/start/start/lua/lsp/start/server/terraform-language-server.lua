return function()
  require('lsp.start')({
    name = 'Terraform Language Server',
    cmd = { 'terraform-ls', 'serve' },
    root_dir = vim.fs.root(0, '.terraform'),
  })
end
