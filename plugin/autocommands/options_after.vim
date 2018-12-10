" This includes options to set after everything has been loaded to overwrite
" possible plugin settings.

augroup OptionsAfter
  autocmd!

  " Do not conceal when in being in the current line.
  autocmd VimEnter * set concealcursor-=in
augroup END
