return function()
  require('lsp.start')({
    name = 'Bash Language Server',
    cmd = { 'bash-language-server', 'start' },
    root_dir = vim.fs.root(0, '.git'),
  })
end
