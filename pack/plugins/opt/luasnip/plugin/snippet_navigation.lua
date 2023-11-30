vim.g.snippet_navigation_jump_forward = function()
  require('luasnip').jump(1)
end

vim.g.snippet_navigation_jump_backward = function()
  require('luasnip').jump(-1)
end
