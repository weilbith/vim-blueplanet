local group = vim.api.nvim_create_augroup('Automatic Formatting', {})
vim.api.nvim_create_autocmd('BufWritePre', {
  group = group,
  callback = function(arguments)
    if require('formatting.configuration').automatic_formatting_is_enabled(arguments.buf) then
      require('formatting').format_buffer(arguments.buf)
    end
  end,
  desc = 'automatically fromats the current buffer before it gets saved',
})
