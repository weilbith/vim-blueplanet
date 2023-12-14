local build_start_options = require('custom.lsp').build_start_options
local find_root = require('custom.lsp.utilities').find_root

vim.lsp.start(vim.tbl_deep_extend('force', build_start_options(vim.bo[0].ft), {
  name = 'Vue Language Server',
  cmd = { 'vue-language-server', '--stdio' },
  root_dir = find_root({ 'package.json' }),
  init_options = {
    typescript = {
      tsdk = find_root({ 'node_modules' }) .. '/node_modules/typescript/lib',
    },
  },
  on_attach = function(client)
    -- Avoid conflicts with NullLS formatting
    client.server_capabilities.documentFormattingProvider = false
  end,
}))
