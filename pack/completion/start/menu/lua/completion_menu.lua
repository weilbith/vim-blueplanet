-- This is an approach to generalize or extend the native `pumvisible()`
-- function. This has become necessary to support custom completion menus but
-- still support independent mappings that alternate their behavior depending on
-- if there is an open menu or not.

local function is_open()
  if type(vim.g.completion_menu_is_open_function) == 'function' then
    return vim.g.completion_menu_is_open_function()
  else
    return vim.api.nvim_call_function('pumvisible', {}) > 0
  end
end

local function entry_is_selected()
  if type(vim.g.completion_menu_entry_is_selected_function) == 'function' then
    return vim.g.completion_menu_entry_is_selected_function()
  else
    return vim.api.nvim_call_function('complete_info', {}).selected >= 0
  end
end

local function is_open_and_entry_selected()
  return is_open() and entry_is_selected()
end

local function confirm_selected_entry()
  if type(vim.g.completion_menu_confirm_selected_entry) == 'function' then
    return vim.g.completion_menu_confirm_selected_entry()
  else
    local control_y_keys = vim.api.nvim_replace_termcodes('<C-y>', true, false, true)
    return vim.api.nvim_feedkeys(control_y_keys, 'm', true)
  end
end

return {
  is_open = is_open,
  entry_is_selected = entry_is_selected,
  is_open_and_entry_selected = is_open_and_entry_selected,
  confirm_selected_entry = confirm_selected_entry,
}
