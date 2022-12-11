local snippet = require('luasnip').snippet
local snippet_node = require('luasnip').snippet_node
local format = require('luasnip.extras.fmt').fmta
local text_node = require('luasnip').text_node
local insert_node = require('luasnip').insert_node
local choice_node = require('luasnip').choice_node
local dynamic_node = require('luasnip').dynamic_node

local trigger_name_node = require('snippets.nodes.general').trigger_name_node

local package_node = format('<keyword><path>', {
  keyword = trigger_name_node('package', ' '),
  path = dynamic_node(1, function()
    local folder_path = vim.api.nvim_call_function('expand', { '%:p:h' })
    local _, _, org_path = string.find(folder_path, '(org/.*)$')
    local _, _, com_path = string.find(folder_path, '(com/.*)$')
    local _, _, net_path = string.find(folder_path, '(net/.*)$')
    local _, _, de_path = string.find(folder_path, '(de/.*)$')
    local raw_path = org_path or com_path or net_path or de_path or 'path/of/package'
    local package_path = string.gsub(raw_path, '/', '.')

    return snippet_node(nil, { insert_node(1, package_path) })
  end, {}),
})

local class_node = format('<keyword><name> <constructor><body>', {
  keyword = trigger_name_node('class', ' '),
  name = dynamic_node(1, function()
    local file_name = vim.api.nvim_call_function('expand', { '%:t:r' })
    return snippet_node(nil, { insert_node(1, file_name) })
  end, {}),
  constructor = choice_node(2, {
    snippet_node(nil, format('(<arguments>)', { arguments = insert_node(1, 'arguments') })),
    text_node(''),
  }),
  body = choice_node(3, {
    snippet_node(nil, format(' {\n  <body>\n}', { body = insert_node(1, '// TODO') })),
    text_node(''),
  }),
})

return nil,
  {
    snippet({ trig = '^package ', regTrig = true }, package_node),
    snippet({ trig = '^%s*%a*%s?class ', regTrig = true }, class_node),
  }
