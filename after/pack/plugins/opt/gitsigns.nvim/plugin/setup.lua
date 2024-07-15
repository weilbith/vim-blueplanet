require('gitsigns').setup({
  numhl = true,
  signcolumn = false, -- Doing it manually in the custom status column.
  current_line_blame = true,
  attach_to_untracked = true,
})
