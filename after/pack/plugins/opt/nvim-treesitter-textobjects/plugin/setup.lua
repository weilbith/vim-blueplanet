vim.cmd.packadd('nvim-treesitter')

require('nvim-treesitter-textobjects').setup({
  select = {
    lookahead = true,
  },
})
