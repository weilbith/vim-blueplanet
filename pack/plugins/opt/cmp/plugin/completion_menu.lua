vim.g.completion_menu_is_open_function = function()
  return require('cmp').visible()
end
