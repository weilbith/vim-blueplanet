-- TODO: Issue is open to fix this properly.
local function fix_highlighting()
  vim.api.nvim_set_hl(0, 'StatusLine', { link = 'DarkGreyBackgroundContrast' })
end

require('true-zen').setup({
  modes = {
    ataraxis = {
      callbacks = {
        open_pos = fix_highlighting,
        close_pos = fix_highlighting,
      },
    },
  },
})
