return function()
  require("lsp.start")({
    name = 'Vue Language Tools',
    cmd = { 'vue-language-server', '--stdio' },
    root_dir = require("lsp.start.utilities").find_root({ 'package.json' }),
    init_options = {
      typescript = {
        tsdk = require("lsp.start.utilities").find_root({ 'node_modules' }) .. '/node_modules/typescript/lib',
      },
    },
  })
end
