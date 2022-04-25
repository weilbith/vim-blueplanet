local sources = require('cmp.config.sources')
local mappings = require('cmp').mapping

require('cmp').setup.cmdline('/', {
  sources = sources({
    { name = 'buffer' },
  }),
  mapping = mappings.preset.cmdline(),
})

require('cmp').setup.cmdline(':', {
  sources = sources({
    { name = 'path' },
    { name = 'cmdline' },
  }),
  mapping = mappings.preset.cmdline(),
})
