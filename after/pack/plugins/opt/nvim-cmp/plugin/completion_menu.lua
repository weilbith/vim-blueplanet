local menu_utilities = require('custom.cmp.menu')

vim.g.completion_menu_is_open_function = function()
  return require('cmp').visible()
end

vim.g.completion_menu_entry_is_selected_function = function()
  return require('cmp').get_selected_entry() ~= nil
end

vim.g.completion_menu_select_next_entry_function = function()
  local next_entry = menu_utilities.get_next_menu_entry()
  local behavior = menu_utilities.get_selection_behavior_for_menu_entry(next_entry)
  require('cmp').select_next_item({ behavior = behavior })
end

vim.g.completion_menu_select_previous_entry_function = function()
  local previous_entry = menu_utilities.get_previous_menu_entry()
  local behavior = menu_utilities.get_selection_behavior_for_menu_entry(previous_entry)
  require('cmp').select_prev_item({ behavior = behavior })
end

vim.g.completion_menu_confirm_selected_entry_function = function()
  require('cmp').confirm({ select = false })
end

vim.g.completion_menu_close_menu_function = function()
  require('cmp').close()
end
