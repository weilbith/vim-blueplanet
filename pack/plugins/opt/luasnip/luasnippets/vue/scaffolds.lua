local snippet = require('luasnip').snippet
local format = require('luasnip.extras.fmt').fmt
local text_node = require('luasnip').text_node
local insert_node = require('luasnip').insert_node
local choice_node = require('luasnip').choice_node

local single_file_component_scaffold_node = format(
  '<template>\n  <div></div>\n</template>\n\n<script{language}{setup}>\n{body}\n</script>',
  {
    language = choice_node(1, {
      text_node(' lang="ts"'),
      text_node(''),
    }),
    setup = choice_node(2, {
      text_node(' setup'),
      text_node(''),
    }),
    body = insert_node(3, '/* TODO */'),
  }
)

local style_node = format('<style{language}{scoped}>\n{body}\n</style>', {
  language = choice_node(1, {
    text_node(' lang="scss"'),
    text_node(''),
  }),
  scoped = choice_node(2, {
    text_node(' scoped'),
    text_node(''),
  }),
  body = insert_node(3, '/* TODO */'),
})

return {
  snippet('<template>', single_file_component_scaffold_node),
  snippet('<style', style_node),
},
  nil
