--- @param name string - name according to `:h fillchars`
local function get_fill_character(name)
  for fill_character in string.gmatch(vim.o.fillchars, '[^%,]+') do
    if string.find(fill_character, name .. ':', 1, true) then
      return string.gmatch(fill_character, ':(.+)$')()
    end
  end
end

--- @param keys string
--- @param mode string | nil - mode according to `:help feedkeys`
local function escape_and_feed_keys(keys, mode)
  local escaped_keys = vim.api.nvim_replace_termcodes(keys, true, false, true)
  vim.api.nvim_feedkeys(escaped_keys, mode, false)
end

--- @param buffer number
--- @return boolean
local function buffer_is_listed(buffer)
  return vim.bo[buffer].buflisted
end

--- @param buffer number
--- @param prefix string
local function buffer_matches_prefix(buffer, prefix)
  return vim.startswith(tostring(buffer), prefix)
end

--- @param buffer number
--- @return string representing the buffer with context
local function format_buffer_option(buffer)
  local name = vim.api.nvim_buf_get_name(buffer)
  return buffer .. ' - ' .. name
end

--- Can be used for user command completion which need a buffer number. Provides
--- a list of all listed buffers, filtered by the user input and gives some
--- context (like buffer name). Always adds the current buffer with number 0.
---
--- @param user_input string
--- @return string[]
local function get_buffers_as_completion_options(user_input)
  local all_buffers = vim.api.nvim_list_bufs()
  vim.list_extend(all_buffers, { 0 })
  local listed_buffers = vim.tbl_filter(buffer_is_listed, all_buffers)
  local filter_by_user_input = function(buffer)
    return buffer_matches_prefix(buffer, user_input)
  end
  local fitered_buffers = vim.tbl_filter(filter_by_user_input, listed_buffers)
  return vim.tbl_map(format_buffer_option, fitered_buffers)
end

return {
  get_fill_character = get_fill_character,
  escape_and_feed_keys = escape_and_feed_keys,
  get_buffers_as_completion_options = get_buffers_as_completion_options,
}
