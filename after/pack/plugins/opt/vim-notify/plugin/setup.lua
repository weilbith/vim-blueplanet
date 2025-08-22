local icons = require('icons')

require('notify').setup({
  stages = 'slide',
  timeout = 3000,
  icons = {
    ERROR = icons.Error,
    WARN = '',
    INFO = '',
    DEBUG = '',
    TRACE = '',
  },
})

vim.notify = require('notify')
vim.notify_once = require('notify')
