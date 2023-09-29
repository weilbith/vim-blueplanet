--- @class Record
--- @field references number | nil
--- @field implementation number | nil
--- @field definition number | nil

--- @param record Record
--- @return string
local function format_lens(record)
  local segments = {}

  if record.references ~= nil then
    local count = record.references
    local designator = 'reference' .. (count == 1 and '' or 's')
    table.insert(segments, count .. ' ' .. designator)
  end

  if record.implementation ~= nil then
    local count = record.implementation
    local designator = 'implementation' .. (count == 1 and '' or 's')
    table.insert(segments, count .. ' ' .. designator)
  end

  if record.definition ~= nil then
    local count = record.definition
    local designator = 'definition' .. (count == 1 and '' or 's')
    table.insert(segments, count .. ' ' .. designator)
  end

  return table.concat(segments, ' | ')
end

return {
  format_lens = format_lens,
}
