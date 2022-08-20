vim.api.nvim_create_autocmd('User', {
  pattern = 'HeirlineInitWinbar',
  callback = function()
    local window_configuration = vim.api.nvim_win_get_config(0)
    local is_floating_window = window_configuration.relative ~= ''

    if is_floating_window then
      vim.opt_local.winbar = nil
    end
  end,
})
