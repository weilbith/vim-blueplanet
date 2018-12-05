" Delete the currently active buffer without closing the window it is displayed in.
" In result the previous buffer will be shown in the window.
"
" Arguments:
"   save  - if the buffer should be written as first (can lead to an error if not and do not force quit)
"   force - if the buffer should be force quit (destroy not saved changes)
"
function! utils#buffers#delete_buffer(save, force) abort
  " Store the current window height to reset it after the split changed it eventually.
  " Only the height is relevant, cause a horizontal split is used.
  let l:height = winheight('%')

  " Save the current buffer if requested.
  if a:save
    write
  endif

  " Open the previous window in a new split and switch back to the to delete buffer.
  bprevious
  split
  bnext

  " Delete the buffer, either force it or not.
  if a:force
    bdelete!
  else
    bdelete
  endif

  " Resize the new window that was split with the previous buffer.
  execute 'resize ' . l:height
endfunction
