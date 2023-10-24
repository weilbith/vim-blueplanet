--- @param name string - name according to `:h fillchars`
local function get_fill_character(name)
  for fill_character in string.gmatch(vim.o.fillchars, '[^%,]+') do
    if string.find(fill_character, name .. ':', 1, true) then
      return string.gmatch(fill_character, ':(.+)$')()
    end
  end
end

return {
  get_fill_character = get_fill_character,
}
