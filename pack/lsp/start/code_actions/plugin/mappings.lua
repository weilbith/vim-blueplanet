vim.keymap.set({ 'n', 'x' }, 'grA', function()
  vim.lsp.buf.code_action({
    filter = function(code_action)
      return code_action.isPreferred
    end,
    apply = true,
  })
end, {
  desc = 'apply preferred code action if there is one',
  noremap = true,
  silent = true,
})
