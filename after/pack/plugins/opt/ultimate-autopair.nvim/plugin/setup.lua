local completion_menu = require('completion.menu')

require('ultimate-autopair').setup({
  bs = {
    indent_ignore = true,
    single_delete = true,
  },
  cr = {
    -- prevent direct mapping and do it manually
    map = '<plug>ultimate-autopair-CR',
    autoclose = true,
    conf = {
      cond = function()
        if completion_menu.is_open_and_entry_selected() then
          completion_menu.confirm_selected_entry()
          return false
        else
          return true
        end
      end,
    },
  },
  extensions = {
    alpha = {
      no_ft_iskeyword = function(options)
        local file_type = require('ultimate-autopair.utils').getsmartft(options)
        return file_type == 'rust' or file_type == 'go'
      end,
    },
  },
})
