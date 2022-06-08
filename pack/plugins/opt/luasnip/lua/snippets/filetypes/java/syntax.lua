local snippet = require('luasnip').snippet
local snippet_node = require('luasnip').snippet_node
local format = require('luasnip.extras.fmt').fmta
local format_with_delimiters = require('luasnip.extras.fmt').fmt
local text_node = require('luasnip').text_node
local insert_node = require('luasnip').insert_node
local choice_node = require('luasnip').choice_node
local dynamic_node = require('luasnip').dynamic_node
local indent_snippet_node = require('luasnip').indent_snippet_node

local fix_closing_character_callbacks =
  require('snippets.callbacks').fix_closing_character_callbacks
local trigger_name_node = require('snippets.utilitiy_nodes').trigger_name_node
local selected_text_node = require('snippets.utilitiy_nodes').selected_text_node

local package_node = format('<keyword><path>;', {
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

local extends_node = format('<keyword><name> ', {
  keyword = trigger_name_node('extends', ' '),
  name = insert_node(1, 'Name'),
})

local implements_node = format('<keyword><name> ', {
  keyword = trigger_name_node('implements', ' '),
  name = insert_node(1, 'Name'),
})

local class_node = format('<keyword><name> <extends><implements>{\n  <body>\n}', {
  keyword = trigger_name_node('class', ' '),
  name = insert_node(1, 'Name'),
  extends = choice_node(2, {
    vim.deepcopy(extends_node),
    text_node(''),
  }),
  implements = choice_node(3, {
    vim.deepcopy(implements_node),
    text_node(''),
  }),
  body = selected_text_node(4, '// TODO'),
})

local interface_node = format('<keyword><name> <extends>{\n  <body>\n}', {
  keyword = trigger_name_node('interface', ' '),
  name = insert_node(1, 'Name'),
  extends = choice_node(2, {
    vim.deepcopy(extends_node),
    text_node(''),
  }),
  body = selected_text_node(3, '// TODO'),
})

local enum_node = format('<keyword><name> {\n  <body>\n}', {
  keyword = trigger_name_node('interface', ' '),
  name = insert_node(1, 'Name'),
  body = selected_text_node(2, '// TODO'),
})

local if_node = format('<keyword><condition>) {\n  <body>\n}', {
  keyword = trigger_name_node('if (', '('),
  condition = insert_node(1, 'true'),
  body = selected_text_node(2, '// TODO'),
})

local else_node = format('<keyword><continuation>', {
  keyword = trigger_name_node('else ', ' '),
  continuation = choice_node(1, {
    snippet_node(nil, format('{\n  <body>\n}', { body = insert_node(1, '// TODO') })),
    vim.deepcopy(if_node),
  }),
})

local case_node
local function get_case_node(index)
  return dynamic_node(index, function()
    return snippet_node(
      nil,
      format('<keyword><condition>:\n\t<body>\n\tbreak;\n\n<continuation>', {
        keyword = trigger_name_node('case', ' '),
        condition = insert_node(1, '"condition"'),
        body = insert_node(2, '// TODO'),
        continuation = choice_node(3, {
          snippet_node(
            nil,
            format('default:\n\t<body>\n', { body = insert_node(1, '// TODO') }, { dedent = false })
          ),
          vim.deepcopy(case_node),
        }),
      })
    )
  end, {})
end

case_node = get_case_node(1)

local switch_case_node = format('<keyword><expression>) {\n<case>\n}', {
  keyword = trigger_name_node('switch ', '('),
  expression = insert_node(1, '"expression"'),
  case = indent_snippet_node(2, {
    text_node('\t'),
    get_case_node(1),
  }, '$PARENT_INDENT\t'),
})

local for_i_condition_node = format_with_delimiters('int i = [min]; i < [max]; [step]', {
  min = insert_node(1, '0'),
  max = insert_node(2, '10'),
  step = insert_node(3, 'i++'),
}, { delimiters = '[]' })

local for_node = format('<keyword><condition>) {\n  <body>\n}', {
  keyword = trigger_name_node('for ', '('),
  condition = choice_node(1, {
    vim.deepcopy(for_i_condition_node),
    insert_node(nil, ''),
  }),
  body = selected_text_node(2, '// TODO'),
})

local while_node = format('<keyword><condition>) {\n  <body>\n}', {
  keyword = trigger_name_node('while ', '('),
  condition = insert_node(1, 'true'),
  body = selected_text_node(2, '// TODO'),
})

return {
  autosnippets = {
    snippet({ trig = '^package ', regTrig = true }, package_node),
    -- The trigger regex here is awkward, somehow a leading space doesn't work.
    snippet({ trig = '^%s*%a*%s?class ', regTrig = true }, class_node),
    snippet({ trig = '^%s*%a*%s?interface ', regTrig = true }, interface_node),
    snippet({ trig = '^%s*%a*%s?enum ', regTrig = true }, enum_node),
    snippet(
      { trig = '^%s*if[%( ]', regTrig = true },
      if_node,
      { callbacks = fix_closing_character_callbacks }
    ),
    snippet(
      { trig = '[} ]else ', regTrig = true },
      else_node,
      { callbacks = fix_closing_character_callbacks }
    ),
    snippet({ trig = ' switch[%( ]', regTrig = true }, switch_case_node),
    snippet({ trig = ' for[%( ]', regTrig = true }, for_node),
    snippet({ trig = ' while[%( ]', regTrig = true }, while_node),
  },
}
