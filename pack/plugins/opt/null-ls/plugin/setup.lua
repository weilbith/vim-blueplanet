local null_ls = require('null-ls_custom')

null_ls.setup()
null_ls.register_source('formatting', 'black')
null_ls.register_source('formatting', 'isort')
null_ls.register_source('formatting', 'stylua')
null_ls.register_source('formatting', 'google_java_format')
null_ls.register_source('formatting', 'prettierd')
null_ls.register_source('formatting', 'stylelint', { filetypes = { 'vue' } })

-- null_ls.register_source('diagnostics', 'actionlint')
null_ls.register_source('diagnostics', 'commitlint')
null_ls.register_source('diagnostics', 'stylelint', { filetypes = { 'vue' } })
null_ls.register_source('diagnostics', 'ktlint')
-- null_ls.register_source('diagnostics', 'spectral')
-- null_ls.register_source('code_lenses', 'foo')
--
-- null_ls.register(require('null-ls_custom.sources.detekt'))
-- null_ls.register(require('null-ls_custom.sources.foo'))
