local completion_menu = require('completion_menu')
local autopair = require('ultimate-autopair.core')

vim.keymap.set('i', '<CR>', function()
  if completion_menu.is_open_and_entry_selected() then
    completion_menu.confirm_selected_entry()
  else
    local plug_keys = vim.api.nvim_replace_termcodes('<plug>ultimate-autopair-CR', true, true, true)
    local autopair_keys = autopair.run_run(plug_keys)
    local do_autopair_action = plug_keys ~= autopair_keys

    if do_autopair_action then
      vim.api.nvim_feedkeys(autopair_keys, 'n', false)
    else
      vim.api.nvim_feedkeys('\r', 'n', false)
    end
  end
end, {
  desc = 'confirm selected entry if completion menu is open, else new line with smart auto-pairing',
})
