return function()
  require('lsp.start')({
    name = 'VSCode JSON Language-Service',
    cmd = { 'vscode-json-language-server', '--stdio' },
    root_dir = vim.fs.root(0, '.git'),
    init_options = {
      provideFormatter = true,
    },
  })
end
