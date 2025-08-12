-- TODO: Issue is open to fix this properly.
local function fix_highlighting()
  vim.cmd.highlight({ 'link StatusLine DarkGreyBackgroundContrast', bang = true })
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
