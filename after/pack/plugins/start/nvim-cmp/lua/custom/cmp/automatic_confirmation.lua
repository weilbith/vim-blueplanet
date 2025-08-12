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
    local completion_item = last_selected_completion_entry:get_completion_item()
    local addition_text_edits = completion_item.additionalTextEdits or {}
    local offset_encoding = last_selected_completion_entry.source:get_position_encoding_kind()
    vim.lsp.util.apply_text_edits(addition_text_edits, 0, offset_encoding)
    clear_last_selected_completion_entry()

    -- TODO: remove at some point
  end
end

return {
  set_last_selected_completion_entry = set_last_selected_completion_entry,
  clear_last_selected_completion_entry = clear_last_selected_completion_entry,
  maybe_confirm_last_selected_completion_entry = maybe_confirm_last_selected_completion_entry,
}
