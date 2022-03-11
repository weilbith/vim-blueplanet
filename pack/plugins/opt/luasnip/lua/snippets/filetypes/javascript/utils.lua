local snippet_node = require('luasnip').snippet_node
local text_node = require('luasnip').text_node
local insert_node = require('luasnip').insert_node
local choice_node = require('luasnip').choice_node
local dynamic_node = require('luasnip').dynamic_node
local get_filetype = require("luasnip.extras.filetype_functions").from_pos_or_filetype

local function get_return_type_node(index)
  return dynamic_node(
    index,
    function()
      print(vim.inspect(get_filetype()[1]))

      if get_filetype()[1] == 'typescript' then
        print('wtf')
        return snippet_node(nil, {
          text_node(': '),
          insert_node(1, 'void'),
        })
      else
        print('correct')
        return snippet_node(nil, { text_node('') })
       end
    end,
    {}
  )
end

local function get_choose_async_node(index)
  return dynamic_node(
    index,
    function()
      return snippet_node(nil, {
        choice_node(1, {
          insert_node(nil, 'async '),
          text_node(''),
        })
      })
    end,
    {}
  )
end

return {
  get_return_type_node = get_return_type_node,
  get_choose_async_node = get_choose_async_node,
}
