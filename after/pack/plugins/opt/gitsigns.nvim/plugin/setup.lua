require('gitsigns').setup({
  numhl = true,
  signcolumn = false, -- Doing it manually in the custom status column.
  current_line_blame = true,
  current_line_blame_opts = {
    virt_text_pos = 'eol',
  },
  _signs_staged_enable = true,
  current_line_blame_formatter_opts = {
    relative_time = true,
  },
})
