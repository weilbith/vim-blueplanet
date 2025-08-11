vim.api.nvim_create_user_command('LuaSnipEdit', function()
  require('luasnip.loaders').edit_snippet_files()
end, { desc = 'edit snippets for filetype of current buffer' })
