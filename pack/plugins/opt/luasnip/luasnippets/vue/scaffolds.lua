local snippet = require('luasnip').snippet
local format = require('luasnip.extras.fmt').fmt
local text_node = require('luasnip').text_node
local insert_node = require('luasnip').insert_node
local choice_node = require('luasnip').choice_node

local fix_closing_character_callbacks =
  require('snippets.callbacks').fix_closing_character_callbacks

return nil,
  {
    snippet(
      {
        trig = '^<sc',
        regTrig = true,
        descr = 'script section for single file component',
      },
      format(
        [[
          <script{language}{setup}>
            {body}
          </script>
        ]],
        {
          language = choice_node(1, {
            format(' lang="{}"', { insert_node(1, 'ts') }, { dedent = false }),
            text_node(''),
          }),
          setup = choice_node(2, {
            text_node(' setup'),
            text_node(''),
          }),
          body = insert_node(3, '// TODO'),
        }
      ),
      {
        callbacks = fix_closing_character_callbacks,
      }
    ),

    snippet(
      {
        trig = '^<st',
        regTrig = true,
        descr = 'style section for single file component',
      },
      format('<style{language}{attribute}>\n{body}\n</style>', {
        language = choice_node(1, {
          format(' lang="{}"', { insert_node(1, 'scss') }, { dedent = false }),
          text_node(''),
        }),
        attribute = choice_node(2, {
          text_node(' scoped'),
          text_node(' module'),
          text_node(''),
        }),
        body = insert_node(3, '/* TODO */'),
      }),
      {
        callbacks = fix_closing_character_callbacks,
      }
    ),
  }
