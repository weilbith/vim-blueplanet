require('lsp_signature').setup({
  bind = true,
  hint_enable = false,
  floating_window_above_cur_line = true, -- Try not to conflict with completion menu
  fix_pos = true,
  hi_parameter = 'BlueBackgroundContrast',
  handler_opts = {
    border = 'single',
  },
})
