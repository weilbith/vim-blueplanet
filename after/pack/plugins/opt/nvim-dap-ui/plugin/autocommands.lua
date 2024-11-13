local group = vim.api.nvim_create_augroup('DAP-UI', {})
vim.api.nvim_create_autocmd('BufWinEnter', {
  pattern = '*',
  group = group,
  callback = function(arguments)
    local file_type = vim.bo[arguments.buf].ft
    local is_dap_ui_buffer = file_type:sub(1, #'dapui') == 'dapui'

    if is_dap_ui_buffer then
      -- How to access correct window by buffer number?
      vim.opt_local.statuscolumn = ''
    end
  end,
})
