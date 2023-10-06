require('gitsigns').setup({
  numhl = true,
  current_line_blame = true,
  current_line_blame_opts = {
    virt_text_pos = 'eol',
  },
  current_line_blame_formatter_opts = {
    relative_time = true,
  },
  signs = {
    add = { hl = 'Green', text = '▌' },
    untracked = { hl = 'Green', text = '▌' },
    change = { hl = 'Blue', text = '▌' },
    delete = { hl = 'Red', text = '▌' },
    topdelete = { hl = 'Red', text = '▌' },
    changedelete = { hl = 'Orange', text = '▌' },
  },
})
