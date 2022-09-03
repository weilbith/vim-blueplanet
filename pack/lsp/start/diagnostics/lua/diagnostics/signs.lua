---@param severity_level 'error' | 'warn' | 'info' | 'hint'
---@return string
local function get_icon_by_severity_level(severity_level)
  local sign_name = 'DiagnosticSign' .. severity_level:gsub('^%l', string.upper)
  local sign_list = vim.api.nvim_call_function('sign_getdefined', { sign_name })
  local sign = sign_list[1] or { text = '' }
  return sign.text
end

return {
  get_icon_by_severity_level = get_icon_by_severity_level,
}
