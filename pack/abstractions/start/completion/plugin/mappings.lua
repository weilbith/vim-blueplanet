local completion_menu = require('completion.menu')

vim.keymap.set({ 'i', 'c', 's' }, '<CR>', function()
  if completion_menu.is_open_and_entry_selected() then
    completion_menu.confirm_selected_entry()
    return ''
  else
    return '<CR>'
  end
end, {
  expr = true,
  desc = 'confirm selected entry if completion menu is open, else normal <CR>',
})

vim.keymap.set({ 'i', 'c', 's' }, '<Tab>', function()
  if completion_menu.is_open() then
    completion_menu.select_next_entry()
    return ''
  else
    return '<Tab>'
  end
end, {
  expr = true,
  desc = 'select next entry if completion menu is open, else normal <Tab>',
})

vim.keymap.set({ 'i', 'c', 's' }, '<S-Tab>', function()
  if completion_menu.is_open() then
    completion_menu.select_previous_entry()
    return ''
  else
    return '<S-Tab>'
  end
end, {
  expr = true,
  desc = 'select previous entry if completion menu is open, else normal <S-Tab>',
})

vim.keymap.set({ 'i', 'c', 's' }, '<C-e>', function()
  if completion_menu.is_open() then
    completion_menu.close_menu()
    return ''
  else
    return '<C-e>'
  end
end, {
  expr = true,
  desc = 'close completion menu if open, else normal control <C-e>',
})
