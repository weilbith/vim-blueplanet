return function()
  require('lsp.start')({
    name = 'Dockerfile Language Server',
    cmd = { 'docker-langserver', '--stdio' },
    root_dir = vim.fs.root(0, 'Dockerfile'),
  })
end
