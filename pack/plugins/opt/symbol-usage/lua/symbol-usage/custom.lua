--- @class Record
--- @field references number | nil
--- @field implementation number | nil
--- @field definition number | nil

local function format_tag(count, designator)
  return {
    { '', 'DarkGrey' },
    { count .. ' ' .. designator, 'LspCodeLens' },
    { ' ', 'DarkGrey' },
  }
end

--- @param record Record
--- @return table | nil
local function format_lens(record)
  local segments = {}

  if record.references ~= nil then
    local count = record.references
    local designator = 'reference' .. (count == 1 and '' or 's')
    local tag_segments = format_tag(count, designator)
    vim.list_extend(segments, tag_segments)
  end

  if record.implementation ~= nil then
    local count = record.implementation
    local designator = 'implementation' .. (count == 1 and '' or 's')
    local tag_segments = format_tag(count, designator)
    vim.list_extend(segments, tag_segments)
  end

  if record.definition ~= nil then
    local count = record.definition
    local designator = 'definition' .. (count == 1 and '' or 's')
    local tag_segments = format_tag(count, designator)
    vim.list_extend(segments, tag_segments)
  end

  return segments
end

return {
  format_lens = format_lens,
}
