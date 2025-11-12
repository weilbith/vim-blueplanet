vim.cmd.packadd('nvim-treesitter')

require('nvim-ts-autotag').setup({
  opts = {
    enable_close = true,
    enable_rename = false, -- LSP linked editing ranges handles this.
  },
})
