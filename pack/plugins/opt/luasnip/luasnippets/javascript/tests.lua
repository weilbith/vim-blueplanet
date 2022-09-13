local snippet = require('luasnip').snippet
local format = require('luasnip.extras.fmt').fmta
local insert_node = require('luasnip').insert_node

local fix_closing_character_callbacks =
  require('snippets.callbacks').fix_closing_character_callbacks
local trigger_name_node = require('snippets.nodes.general').trigger_name_node
local selected_text_node = require('snippets.nodes.general').selected_text_node
local file_name_node = require('snippets.nodes.general').file_name_node

local is_test_file = require('snippets.conditions').is_test_file

local get_choose_async_node = require('snippets.nodes.javascript').get_choose_async_node

local jest_describe_node = format("<keyword>'<name>', <async>() =>> {\n  <body>\n})", {
  keyword = trigger_name_node('describe', '('),
  name = file_name_node(1, 'name'),
  async = get_choose_async_node(2),
  body = selected_text_node(3, '// TODO'),
})

local jest_test_node = format("<keyword>'<description>', <async>() =>> {\n  <body>\n})", {
  keyword = trigger_name_node('test', '('),
  description = insert_node(1, 'it can do ...'),
  async = get_choose_async_node(2),
  body = selected_text_node(3, '// TODO'),
})

local jest_hook_node = format('<keyword><async>() =>> {\n  <body>\n})', {
  keyword = trigger_name_node('unknownHook', '('),
  async = get_choose_async_node(1),
  body = selected_text_node(2, '// TODO'),
})

return nil,
  {
    snippet('describe(', jest_describe_node, {
      callbacks = fix_closing_character_callbacks,
      condition = is_test_file,
    }),
    snippet(' test(', vim.deepcopy(jest_test_node), {
      callbacks = fix_closing_character_callbacks,
      condition = is_test_file,
    }),
    snippet(' it(', vim.deepcopy(jest_test_node), {
      callbacks = fix_closing_character_callbacks,
      condition = is_test_file,
    }),
    snippet(' beforeAll', vim.deepcopy(jest_hook_node), { condition = is_test_file }),
    snippet(' beforeEach', vim.deepcopy(jest_hook_node), { condition = is_test_file }),
    snippet(' afterEach', vim.deepcopy(jest_hook_node), { condition = is_test_file }),
    snippet(' afterAll', vim.deepcopy(jest_hook_node), { condition = is_test_file }),
  }
