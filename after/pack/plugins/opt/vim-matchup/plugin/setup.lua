vim.cmd.packadd('nvim-treesitter')

require('match-up').setup({
  matchparen = {
    offscreen = {
      method = 'popup',
    },
    deferred = 1,
    hi_surround_always = 1,
  },
})
