local kind_icons = require('cmp_custom.kind_icons')
local source_icons = require('cmp_custom.source_icons')

local function format_entry(entry, vim_item)
  local kind_icon = kind_icons[vim_item.kind] or ''
  local kind_name = vim_item.kind
  local source_icon = source_icons[entry.source.name] or entry.source.name

  vim_item.kind = string.format('%s %s', kind_icon, kind_name)
  vim_item.menu = string.format('[ %s ]', source_icon)

  return vim_item
end

return {
  format_entry = format_entry,
}
