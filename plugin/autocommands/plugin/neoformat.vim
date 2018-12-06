augroup NeoformatCustom
  autocmd!
  autocmd BufWritePre * call plugin#neoformat#format_buffer()
augroup END
