return function()
  require('lsp.start')({
    name = 'Vim Language Server',
    cmd = { 'vim-language-server', '--stdio' },
    root_dir = vim.fs.root(0, '.git'),
    init_options = {
      isNeovim = true,
      iskeyword = '@,48-57,_,192-255,-#',
      indexes = {
        count = 3,
        projectRootPatterns = { 'runtime', 'nvim', '.git', 'autoload', 'plugin' },
      },
      suggest = { fromVimruntime = true },
    },
  })
end
