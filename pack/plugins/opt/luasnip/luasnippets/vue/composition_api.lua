local snippet = require('luasnip').snippet
local snippet_node = require('luasnip').snippet_node
local format = require('luasnip.extras.fmt').fmta
local text_node = require('luasnip').text_node
local insert_node = require('luasnip').insert_node
local choice_node = require('luasnip').choice_node
local dynamic_node = require('luasnip').dynamic_node
local indent_snippet_node = require('luasnip').indent_snippet_node

local trigger_name_node = require('snippets.nodes.general').trigger_name_node
local is_end_of_line = require('snippets.conditions').is_end_of_line

local computed_node = format('<keyword><body>)', {
  keyword = trigger_name_node('= computed(', '('),
  body = choice_node(1, {
    format('() =>> { <body> }', {
      body = insert_node(1, '/* TODO */'),
    }),
    format('{\n  get: () =>> { <get> },\n  set: (newValue) =>> { <set> },\n}', {
      get = insert_node(1, '// TODO'),
      set = insert_node(2, '// TODO'),
    }),
  }),
})

local watch_node = format('<keyword><source>, (<new_value>) =>> { <callback> }<options>)', {
  keyword = trigger_name_node('watch(', '('),
  source = choice_node(1, {
    insert_node(nil, 'source'),
    format('() =>> <body>', {
      body = insert_node(1, 'source'),
    }),
  }),
  new_value = insert_node(2, ''),
  callback = insert_node(3, '/* TODO */'),
  options = choice_node(4, {
    text_node(''),
    format(', { <body> }', {
      body = insert_node(1, 'immediate: true'),
    }),
  }),
})

local props_node = format('interface Props {\n  <body>\n}\n\n<variable><define_props>', {
  body = insert_node(1, '// TODO'),
  variable = choice_node(2, {
    text_node(''),
    text_node('const props = '),
  }),
  define_props = choice_node(3, {
    text_node('defineProps<Props>()'),
    format('withDefaults(defineProps<<Props>>(), {\n  <body>\n})', {
      body = insert_node(1, '// TODO'),
    }),
  }),
})

local emit_entry_node
local function get_emit_entry_node(index)
  return dynamic_node(index, function()
    return snippet_node(
      nil,
      format('\n\n(event: "<event>", value: <value>): void,<continuation>', {
        event = insert_node(1, 'name'),
        value = insert_node(2, 'type'),
        continuation = choice_node(3, {
          text_node(''),
          vim.deepcopy(emit_entry_node),
        }),
      })
    )
  end, {})
end

emit_entry_node = get_emit_entry_node(1)

local emits_node = format('interface Emits {<body>\n}\n\nconst emit = defineEmits<<Emits>>()', {
  body = indent_snippet_node(1, {
    text_node('\t'),
    get_emit_entry_node(1),
  }, '$PARENT_INDENT\t'),
})

local function get_hook_snippet(hook_name)
  local hook_node = format('<keyword><callback>)', {
    keyword = trigger_name_node(hook_name, '('),
    callback = choice_node(1, {
      insert_node(nil, 'callback'),
      format('() =>> { <body> }', {
        body = insert_node(1, '/* TODO */'),
      }),
    }),
  })

  return snippet({ trig = '^' .. hook_name, regTrig = true }, hook_node)
end

return nil,
  {
    snippet({ trig = '= computed' }, computed_node, { condition = is_end_of_line }),
    snippet({ trig = '^watch', regTrig = true }, watch_node),
    snippet({ trig = '^props', regTrig = true }, props_node),
    snippet({ trig = '^emit', regTrig = true }, emits_node),
    get_hook_snippet('onBeforeMount'),
    get_hook_snippet('onMounted'),
    get_hook_snippet('onActivated'),
    get_hook_snippet('onBeforeUpdate'),
    get_hook_snippet('onUpdated'),
    get_hook_snippet('onDeactivated'),
    get_hook_snippet('onUnmounted'),
  }
