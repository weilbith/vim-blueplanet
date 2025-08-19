vim.cmd.packadd('nvim-web-devicons')

require('diffview').setup({
  enhanced_diff_hl = true,
  show_help_hints = false,
  signs = {
    fold_closed = vim.opt.fillchars:get().foldclose,
    fold_open = vim.opt.fillchars:get().foldopen,
  },
})
