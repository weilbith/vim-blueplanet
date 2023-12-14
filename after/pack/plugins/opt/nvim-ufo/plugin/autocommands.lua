vim.api.nvim_create_augroup('ufo-peek', {})
vim.api.nvim_create_autocmd('CursorHold', {
  group = 'ufo-peek',
  callback = function()
    local window_number = require('ufo').peekFoldedLinesUnderCursor()

    if window_number then
      vim.wo[window_number].statuscolumn = ''
      vim.wo[window_number].listchars = 'tab:  ,trail: ,nbsp: ' -- awkwardly unset default to disable
    end
  end,
  desc = 'peek fold under cursor and clean up preview options',
})
