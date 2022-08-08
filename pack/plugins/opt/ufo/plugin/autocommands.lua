vim.api.nvim_create_autocmd('CursorHold', {
  callback = function()
    require('ufo').peekFoldedLinesUnderCursor()
  end,
})
