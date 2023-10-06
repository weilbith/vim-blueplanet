local completion_menu = require('completion_menu')

require('ultimate-autopair').setup({
  bs = {
    indent_ignore = true,
    single_delete = true,
  },
  cr = {
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
        return 'rust' == require('ultimate-autopair.utils').getsmartft(options)
      end,
    },
  },
})
