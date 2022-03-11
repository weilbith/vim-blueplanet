local snippet = require('luasnip').snippet
local snippet_node = require('luasnip').snippet
local format = require('luasnip.extras.fmt').fmta
local text_node = require('luasnip').text_node
local insert_node = require('luasnip').insert_node
local choice_node = require('luasnip').choice_node

local fix_closing_character_callbacks = require('snippets.callbacks').fix_closing_character_callbacks
local trigger_name_node = require('snippets.utilitiy_nodes').trigger_name_node
local selected_text_node = require('snippets.utilitiy_nodes').selected_text_node
local file_name_node = require('snippets.utilitiy_nodes').file_name_node

local is_test_file = require('snippets.conditions').is_test_file

local busted_describe_node = format(
"<keyword>'<name>', function()\n  <body>\nend)",
    {
    keyword = trigger_name_node('describe', '('),
    name = file_name_node(1, 'name'),
    body = selected_text_node(2, '-- TODO'),
    }
)

local busted_it_node = format(
"<keyword>'<description>', function()\n  <body>\nend)",
    {
    keyword = trigger_name_node('it', '('),
    description = insert_node(1, 'it can do ...'),
    body = selected_text_node(2, '-- TODO'),
    }
)

-- local jest_hook_node = format(
-- '<keyword><async>() =>> {\n  <body>\n})',
--     {
--     keyword = trigger_name_node('unknownHook', '('),
--     async = get_choose_async_node(1),
--     body = selected_text_node(2, '// TODO'),
--     }
-- )

return {
  autosnippets = {
    snippet(
    'describe(',
        busted_describe_node,
        {
        callbacks = fix_closing_character_callbacks,
        condition = is_test_file,
        }
    ),
    snippet(
    ' it(',
        busted_it_node,
        {
        callbacks = fix_closing_character_callbacks,
        condition = is_test_file,
        }
    ),
    -- snippet(
    -- ' beforeAll',
    --     vim.deepcopy(jest_hook_node),
    --     { condition = is_test_file }
    -- ),
    -- snippet(
    -- ' beforeEach',
    --     vim.deepcopy(jest_hook_node),
    --     { condition = is_test_file }
    -- ),
    -- snippet(
    -- ' afterEach',
    --     vim.deepcopy(jest_hook_node),
    --     { condition = is_test_file }
    -- ),
    -- snippet(
    -- ' afterAll',
    --     vim.deepcopy(jest_hook_node),
    --     { condition = is_test_file }
    -- ),
  },
}
