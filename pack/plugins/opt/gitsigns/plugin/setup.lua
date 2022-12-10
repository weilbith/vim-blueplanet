require('gitsigns').setup({
  numhl = true,
  current_line_blame = true,
  current_line_blame_opts = {
    virt_text_pos = 'eol',
  },
  current_line_blame_formatter_opts = {
    relative_time = true,
  },
})
