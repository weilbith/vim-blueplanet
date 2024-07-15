local start_server = require('custom.lsp').start_server
local build_start_options = require('custom.lsp').build_start_options

start_server(build_start_options({
  name = 'Vim Language Server',
  cmd = { 'vim-language-server', '--stdio' },
  init_options = {
    isNeovim = true,
    iskeyword = '@,48-57,_,192-255,-#',
    indexes = {
      count = 3,
      projectRootPatterns = { 'runtime', 'nvim', '.git', 'autoload', 'plugin' },
    },
    suggest = { fromVimruntime = true },
  },
}))
