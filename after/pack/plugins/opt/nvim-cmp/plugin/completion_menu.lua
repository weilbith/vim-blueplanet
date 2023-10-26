vim.g.completion_menu_is_open_function = function()
  return require('cmp').visible()
end

vim.g.completion_menu_entry_is_selected_function = function()
  return require('cmp').get_selected_entry() ~= nil
end

vim.g.completion_menu_select_next_entry_function = function()
  require('cmp').select_next_item()
end

vim.g.completion_menu_select_previous_entry_function = function()
  require('cmp').select_prev_item()
end

vim.g.completion_menu_confirm_selected_entry_function = function()
  require('cmp').confirm({ select = false })
end

vim.g.completion_menu_close_menu_function = function()
  require('cmp').close()
end
