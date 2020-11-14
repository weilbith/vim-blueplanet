augroup LightlineCustom
  autocmd!
  autocmd BufWritePost,TextChanged * call lightline#update()
  autocmd User LspDiagnosticsChanged call lightline#update()
augroup END
