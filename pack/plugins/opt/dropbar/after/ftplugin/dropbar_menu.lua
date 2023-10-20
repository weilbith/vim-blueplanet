local function find_top_level_menu(menu)
  menu = menu or require('dropbar.api').get_current_dropbar_menu()

  if menu.prev_menu then
    return find_top_level_menu(menu.prev_menu)
  else
    return menu
  end
end

local function close_all_menus()
  local top_level_menu = find_top_level_menu()
  top_level_menu:close()
end

local function close_sub_menu()
  local menu = require('dropbar.api').get_current_dropbar_menu()
  menu:close()
end

local function expand_sub_menu()
  local cursor = vim.api.nvim_win_get_cursor(0)
  local current_line = cursor[1]
  local expand_symbol_column = 2
  local menu = require('dropbar.api').get_current_dropbar_menu()
  menu:click_at({ current_line, expand_symbol_column }, nil, 1, 'l')
end

vim.keymap.set('n', 'q', close_all_menus, { buffer = true })
vim.keymap.set('n', '<esc>', close_all_menus, { buffer = true })
vim.keymap.set('n', 'l', expand_sub_menu, { buffer = true })
vim.keymap.set('n', 'h', close_sub_menu, { buffer = true })

vim.opt_local.winhighlight = 'Normal:BlueBackgroundContrast'

vim.defer_fn(function()
  vim.opt_local.winbar = nil
end, 1)
