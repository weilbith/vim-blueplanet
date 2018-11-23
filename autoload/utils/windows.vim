" Persistent state variables for the window functions.
let s:site_window_stack = []
let s:empty_window = {'open': '', 'close': ''}

" Switch the windows which open on the left site.
" The idea is that only one of this windows should be open at the same time.
" When open a new window at this site, a possible currently open one get
" closed before.
" When the currently shown window will be closed, the before open window at
" this position will be reopened.
" In case the stack of windows is empty, no window is displayed when the last
" has been closed.
"
" Arguments:
"   current - dictionary with an 'open' and 'close' command for the window
"
function! utils#windows#switch_site_window(current) abort
  let l:top_index = len(s:site_window_stack) - 1
  let l:prev_index = l:top_index - 1
  let l:top_window = s:get_window(l:top_index)
  let l:prev_window = s:get_window(l:prev_index)

  " Close window if currently open and open last one.
  if l:top_window == a:current
    execute l:top_window['close']
    execute l:prev_window['open']
    call remove(s:site_window_stack, l:top_index)

  " Close the old window, open the new and add at top of stack.
  else
    execute l:top_window['close']
    execute a:current['open']
    call add(s:site_window_stack, a:current)
  endif
endfunction


" Internal utility function to access windows on the stack.
" This is necessary, since the origin get function for lists is not reliable
" for negative index values.
"
" Arguments:
"   index - window index to get from the stack
"
function! s:get_window(index) abort
  " Return empty window if out of bounds.
  if a:index < 0 || a:index >= len(s:site_window_stack)
    return s:empty_window

  " Return the window at the given index
  else
    return get(s:site_window_stack, a:index)
  endif
endfunction
