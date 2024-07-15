return function()
  require("lsp.start")({
    name = 'Python LSP Server',
    cmd = { 'pylsp' },
    root_dir = require("lsp.start.utilities").find_root({
      'pyproject.toml',
      'setup.py',
    }),
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
