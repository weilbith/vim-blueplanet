augroup Quickfix
  autocmd!
  autocmd BufReadPost quickfix call utils#quickfix#resize_move()
  autocmd CursorHold * nested call utils#quickfix#show_quickfix_preview()
  autocmd QuitPre * nested call utils#quickfix#unset_quickfix_window_nr()

  " -> a buffer is shown in the preview window, that does not exits so far
  " In this case the buffer is not already loaded and setting local variables does not work.
  " Set a flag that mark this event to handle it later on when the buffer is loaded.
  autocmd bufadd * nested call utils#quickfix#set_quickfix_preview_flag()

  " -> event that should follow after a (new) buffer has entered to the preview window
  " Check if the flag has been set, that this is a new preview buffer.
  " The buffer is now available and local settings and variables can be defined.
  " Mark the buffer as preview only buffer for recognize him on possibly
  " future events.
  autocmd bufwinenter * nested call utils#quickfix#enable_preview_settings()

  " -> the buffer in the preview window will be opened anywhere else
  " In case a buffer is entered, that has been marked on becoming an preview
  " buffer earlier on, the special settings will be removed, as well as the
  " marker.
  autocmd bufenter * nested call utils#quickfix#disable_preview_settings()

augroup END
