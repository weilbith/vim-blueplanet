require('fidget').setup({
  config = 'vim.cmd("packadd fidget.nvim")',
  progress = {
    display = {
      done_icon = require('icons').CircleCheck,
      done_style = 'GreenBold',
      progress_icon = {
        pattern = 'arc',
      },
      progress_style = 'GreyItalic',
      group_style = 'WhiteBold',
      icon_style = 'Bold',
    },
  },
})
