augroup Options
  autocmd!
  autocmd WinEnter * set cursorline
  autocmd WinLeave * if &filetype !=# 'denite' | set nocursorline | endif
augroup END
