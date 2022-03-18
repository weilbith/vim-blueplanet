local snippet = require('luasnip').snippet
local format = require('luasnip.extras.fmt').fmt

return {
  snippets = {
    snippet('author', format('Thore Straßburg', {})),
  },
}
