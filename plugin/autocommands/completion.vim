augroup Completion
  autocmd!
  autocmd CompleteDone * call utils#completion#try_expand()
augroup END
