local SymbolKind = vim.lsp.protocol.SymbolKind
local format_lens

require('symbol-usage').setup({
  hl = { link = 'LspCodeLens' },
  text_format = format_lens,
  definition = {
    enabled = false,
  },
  implementation = {
    enabled = true,
    kinds = { SymbolKind.Interface },
  },
  references = {
    enabled = true,
    kinds = {
      SymbolKind.Class,
      SymbolKind.Interface,
      SymbolKind.Enum,
      SymbolKind.EnumMember,
      SymbolKind.Function,
      SymbolKind.Method,
    },
  },
  filetypes = {
    -- Conflicts with Rusts language server lenses which are better.
    rust = {
      definition = { enabled = false },
      implementation = { enabled = false },
      references = { enabled = false },
    },
  },
})

--- @class Record
--- @field references? number
--- @field implementation? number
--- @field definition? number | nil

local function format_tag(count, designator)
  return {
    { '', 'DarkGrey' },
    { count .. ' ' .. designator, 'LspCodeLens' },
    { ' ', 'DarkGrey' },
  }
end

--- @param record Record
--- @return table | nil
format_lens = function(record)
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
