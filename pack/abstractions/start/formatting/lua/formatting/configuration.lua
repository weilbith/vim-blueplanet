local OPTION_NAME = 'automatic_formatting_is_enabled'

--- Buffer local preference rules over global preference.
---
--- @param buffer? number default for global preference
--- @return boolean
local function automatic_formatting_is_enabled(buffer)
  local is_enabled_on_buffer = buffer ~= nil and vim.b[buffer][OPTION_NAME] or nil
  local is_enabled_globally = vim.g[OPTION_NAME]

  if is_enabled_on_buffer ~= nil then
    return is_enabled_on_buffer
  else
    return is_enabled_globally or false
  end
end

--- Toggles automatic formatting on or off. Applies to a locally for a specific
--- buffer only if specified, else globally for all buffers.
---
--- @param buffer? number
--- @return boolean if formatting is now on or off
local function toggle_automatic_formatting(buffer)
  local is_enabled = automatic_formatting_is_enabled(buffer)
  local is_enabled_now = not is_enabled

  if buffer ~= nil then
    vim.b[buffer][OPTION_NAME] = is_enabled_now
  else
    vim.g[OPTION_NAME] = is_enabled_now
  end

  return is_enabled_now
end

return {
  automatic_formatting_is_enabled = automatic_formatting_is_enabled,
  toggle_automatic_formatting = toggle_automatic_formatting,
}
