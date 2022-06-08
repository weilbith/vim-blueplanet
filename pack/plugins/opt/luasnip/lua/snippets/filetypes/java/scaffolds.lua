local snippet = require('luasnip').snippet
local format = require('luasnip.extras.fmt').fmta

local selected_text_node = require('snippets.utilitiy_nodes').selected_text_node

local main_node = format(
  'public class App {\n  public static void main(String[] args) {\n    <body>\n  }\n}',
  {
    body = selected_text_node(1, '// TODO'),
  }
)

return {
  snippets = {
    snippet('main scaffold', main_node),
  },
}
