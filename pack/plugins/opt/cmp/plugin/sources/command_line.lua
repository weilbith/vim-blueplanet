local sources = require('cmp.config.sources')

require('cmp').setup.cmdline('/', {
  sources = sources({
    { name = 'buffer' },
  }),
})

require('cmp').setup.cmdline(':', {
  sources = sources({
    { name = 'path' },
    { name = 'cmdline' },
  }),
})
