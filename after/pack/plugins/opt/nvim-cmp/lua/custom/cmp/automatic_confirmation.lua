local cmp = require('cmp')

local last_selected_completion_entry = nil

--- @param completion_entry unknown | nil
--- @return nil
local function set_last_selected_completion_entry(completion_entry)
  last_selected_completion_entry = completion_entry
end

local function clear_last_selected_completion_entry()
  last_selected_completion_entry = nil
end

local function maybe_confirm_last_selected_completion_entry()
  if last_selected_completion_entry ~= nil then
    cmp.core:confirm(last_selected_completion_entry, {})
    clear_last_selected_completion_entry()
  end
end

return {
  set_last_selected_completion_entry = set_last_selected_completion_entry,
  clear_last_selected_completion_entry = clear_last_selected_completion_entry,
  maybe_confirm_last_selected_completion_entry = maybe_confirm_last_selected_completion_entry,
}
