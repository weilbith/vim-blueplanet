-- This is an approach to generalize or extend the native completion menu
-- functionality. This has become necessary to support custom completion menus
-- but still support independent mappings that alternate their behavior
-- depending on if there is an open menu or not.

local escape_and_feed_keys = require('custom.utils').escape_and_feed_keys

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

local function select_next_entry()
  if type(vim.g.completion_menu_select_next_entry_function) == 'function' then
    vim.g.completion_menu_select_next_entry_function()
  else
    escape_and_feed_keys('<Down>', 'n')
  end
end

local function select_previous_entry()
  if type(vim.g.completion_menu_select_previous_entry) == 'function' then
    vim.g.completion_menu_select_previous_entry_function()
  else
    escape_and_feed_keys('<Up>', 'n')
  end
end

local function confirm_selected_entry()
  if type(vim.g.completion_menu_confirm_selected_entry_function) == 'function' then
    vim.g.completion_menu_confirm_selected_entry_function()
  else
    escape_and_feed_keys('<C-y>', 'n')
  end
end

local function close_menu()
  if type(vim.g.completion_menu_close_menu_function) == 'function' then
    vim.g.completion_menu_close_menu_function()
  else
    escape_and_feed_keys('<C-e>', 'n')
  end
end

return {
  is_open = is_open,
  entry_is_selected = entry_is_selected,
  is_open_and_entry_selected = is_open_and_entry_selected,
  select_next_entry = select_next_entry,
  select_previous_entry = select_previous_entry,
  confirm_selected_entry = confirm_selected_entry,
  close_menu = close_menu,
}
