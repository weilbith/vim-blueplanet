local insert_components = require('heirline.utils').insert

local separator = ''
local symbols = {}

for name, settings in pairs(require('lsp.symbols')) do
  if settings.is_symbol_kind then
    symbols[name] = { icon = settings.icon, hl = settings.highlight }
  end
end

require('dropbar').setup({
  general = {
    enable = false,
  },
  icons = {
    symbols = symbols,
    ui = {
      bar = {
        separator = ' ' .. separator .. ' ',
      },
      menu = {
        indicator = separator,
      },
    },
  },
  bar = {
    padding = {
      left = 0,
      right = 0,
    },
  },
})

local CodeLocation = {
  provider = function()
    ---@diagnostic disable-next-line: undefined-field
    local content = _G.dropbar.get_dropbar_str()
    content = content:gsub('%%%*', '')
    content = content:gsub(separator, '%%#WhiteBold#' .. separator)
    return content
  end,
}

return insert_components(CodeLocation)
