return function()
  require('lsp.start')({
    name = 'Python LSP Server',
    cmd = { 'pylsp' },
    root_dir = vim.fs.root(0, { 'pyproject.toml', 'setup.py' }),
    settings = {
      pyls = {
        plugins = {
          pycodestyle = {
            enabled = false,
          },
          pyls_mypy = {
            enabled = true,
          },
        },
      },
    },
  })
end
