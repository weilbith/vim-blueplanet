local completion_menu = require('completion_menu')
local escape_and_feed_keys = require('custom.utils').escape_and_feed_keys

vim.keymap.set({ 'i', 'c' }, '<CR>', function()
  if completion_menu.is_open_and_entry_selected() then
    completion_menu.confirm_selected_entry()
  else
    escape_and_feed_keys('<CR>', 'n')
  end
end, {
  unique = true,
  desc = 'confirm selected entry if completion menu is open, else normal <CR>',
})

vim.keymap.set({ 'i', 'c' }, '<Tab>', function()
  if completion_menu.is_open() then
    completion_menu.select_next_entry()
  else
    escape_and_feed_keys('<Tab>', 'n')
  end
end, {
  unique = true,
  desc = 'select next entry if completion menu is open, else normal <Tab>',
})

vim.keymap.set({ 'i', 'c' }, '<S-Tab>', function()
  if completion_menu.is_open() then
    completion_menu.select_previous_entry()
  else
    escape_and_feed_keys('<S-Tab>', 'n')
  end
end, {
  unique = true,
  desc = 'select previous entry if completion menu is open, else normal <S-Tab>',
})

vim.keymap.set({ 'i', 'c' }, '<C-e>', function()
  if completion_menu.is_open() then
    completion_menu.close_menu()
  else
    escape_and_feed_keys('<C-e>', 'n')
  end
end, {
  unique = true,
  desc = 'close completion menu if open, else normal control <C-e>',
})
