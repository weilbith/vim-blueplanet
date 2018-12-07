" Jump to the output window for QuickRun.
" If being already inside and have jumped before with this function to it,
" jump back to the origin window.
"
function! plugin#quickrun#goto() abort
  " Check if being within the QuickRun window and if the jump command has been
  " used, so the jump will be done back.
  if get(s:, 'previous_window_id', -1) > 0 && &filetype ==# 'quickrun'
    call win_gotoid(s:previous_window_id)
    unlet s:previous_window_id

  " Jump to the QuickRun window.
  else
    call s:jump_or_close(v:false)
  endif
endfunction


" Close to the output window for QuickRun.
" Jumps back from the window from where invoked.
"
function! plugin#quickrun#close() abort
  call s:jump_or_close(v:true)
endfunction


" Internal

" Find out which window contains the QuickRun buffer.
" Jumps to the buffer, while remember from where jumped.
" Close the window and jump back if the argument is true.
"
" Arguments:
"   close - boolean if the window should be closed
"
function! s:jump_or_close(close) abort
  " Ask each open window if it contains the quickrun output buffer.
  let g:quickrun_win_id = -1
  windo if &filetype ==# 'quickrun' | let g:quickrun_win_id = win_getid() | endif

  " Check if a quickrun output window is open.
  if g:quickrun_win_id > 0
    let s:previous_window_id = win_getid()
    call win_gotoid(g:quickrun_win_id)

    " Close and jump back if requested.
    if a:close
      norm q

      " Jump back to previous window if it was not invoked from within the
      " already closed quickrun window.
      if g:quickrun_win_id !=# s:previous_window_id
        call win_gotoid(s:previous_window_id)
        unlet s:previous_window_id
      endif
    endif

  else
    call utils#messages#warning('No QuickRun output window open!')
  endif
endfunction
