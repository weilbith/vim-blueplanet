local snippet_events = require('luasnip.util.events')

local function get_character_after_snippet(snippet)
  local line_index = snippet.mark:pos_end()[1]
  local character_index = snippet.mark:pos_end()[2] + 1
  local line_content = vim.api.nvim_buf_get_lines(0, line_index, line_index + 1, false)[1]
  local character = line_content:sub(character_index, character_index)
  return character
end

local function is_closing_character(character)
  return character:find('[%)%]}>]') and true or false
end

local function delete_character_after_snippet(snippet)
  local line_index = snippet.mark:pos_end()[1]
  local character_index = snippet.mark:pos_end()[2] + 1
  vim.api.nvim_buf_set_text(0, line_index, character_index - 1, line_index, character_index, { '' })
end

local function remove_automatically_inserted_closing_character_after_snippet_trigger(snippet)
  local character = get_character_after_snippet(snippet)

  if is_closing_character(character) then
    delete_character_after_snippet(snippet)
  end
end

-- This tackles the problem if a snippets its trigger ends with a opening
-- character (e.g. `(`, `[`, ...) and another plugin is automatically inserting
-- the matching closing character. In result the closing character will end up
-- at the end of the inserted snippets content. This leads to invalid syntax and
-- needs to be removed manually every time.
-- Add this callback definition to a snippet with such a trigger to fix this
-- automatically.
local fix_closing_character_callbacks = {
  [-1] = {
    [snippet_events.enter] = remove_automatically_inserted_closing_character_after_snippet_trigger,
  },
}

return {
  fix_closing_character_callbacks = fix_closing_character_callbacks,
}
