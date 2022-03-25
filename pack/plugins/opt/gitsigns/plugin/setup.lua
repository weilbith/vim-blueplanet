require('gitsigns').setup({
  numhl = true,
  sign_priority = 1,
  keymaps = {},
  current_line_blame = true,
  current_line_blame_opts = {
    virt_text_pos = 'eol',
  },
  current_line_blame_formatter_opts = {
    relative_time = true,
  },
})
