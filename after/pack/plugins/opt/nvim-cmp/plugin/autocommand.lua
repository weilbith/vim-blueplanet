local function open_completion_menu_for_choices()
  vim.schedule(function()
    require('cmp').complete({
      config = { sources = { { name = 'luasnip_choice' } } },
    })
  end)
end

local group = vim.api.nvim_create_augroup('cmp_luasnip_choice', {})
vim.api.nvim_create_autocmd('User', {
  group = group,
  pattern = { 'LuasnipChangeChoice', 'LuasnipChoiceNodeEnter' },
  callback = open_completion_menu_for_choices,
})
