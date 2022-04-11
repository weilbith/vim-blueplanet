local null_ls = require('null-ls_custom')

null_ls.setup()
null_ls.register_source('formatting', 'black')
null_ls.register_source('formatting', 'isort')
null_ls.register_source('formatting', 'stylua')
null_ls.register_source('formatting', 'google_java_format')
