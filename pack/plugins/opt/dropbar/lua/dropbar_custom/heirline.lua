local separator = require('dropbar_custom.constants').separator

return {
  provider = function()
    ---@diagnostic disable-next-line: undefined-field
    local content = _G.dropbar.get_dropbar_str()
    content = content:gsub('%%%*', '')
    content = content:gsub(separator, '%%#WhiteBold#' .. separator)
    return content
  end,
}
