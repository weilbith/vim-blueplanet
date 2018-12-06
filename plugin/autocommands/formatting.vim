augroup Formatting
  autocmd!
  autocmd BufWritePre * call utils#formatting#format_buffer()
augroup END
