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

return {
  get_fill_character = get_fill_character,
  escape_and_feed_keys = escape_and_feed_keys,
}
