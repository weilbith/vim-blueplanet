" Persistent state variables for the window functions.
let s:site_window_stack = []
let s:empty_window = {'open': '', 'close': ''}

" Change the size of the active window by a user input.
" There are two modes 'height' and 'width', which have to provided as first argument.
" The user input is used as set to a fixed width/height by a plain number,
" or a relative in-/decrease of the current width/height by prefix a '+' or '-'.
" The procedure can be interrupted by hitting <Esc>.
" Furthermore it shows the current width or height in brackets.
"
" Arguments:
"   mode - decide if to change the 'width' or 'height'
"
function! utils#windows#windowChangeSize(mode) abort
  " Set the vertical parameter if the width should be changed.
  let l:vertical = ''
  if a:mode ==# 'width' | let l:vertical = 'vertical ' | endif

  " Get the current window width/height.\
  let l:size = winheight('%')
  if a:mode ==# 'width' | let l:size = winwidth('%') | endif

  " Request user for the adjustment.
  let l:change = input('In-/Decrease by (+/- number) or set to fix width/height (number) [' . l:size .']: ')

  " End here, if no input has given.
  if l:change ==# '' | return | endif

  " Change windows size.
  execute l:vertical . 'resize ' . l:change
endfunction


" Toggle a window between maximized and normal.
" Use the Goyo plugin to maximize the window.
" Functions restore the line position that has been used within the maximized window.
"
function! utils#windows#toggle_max_window() abort
  " Maximize the window if its the first time, or if no window is currently maximized.
  if !exists('s:window_maximized') || !s:window_maximized
    let s:maximized_window_id = win_getid() " Store window, cause exiting maximized land in different window
    let s:window_maximized = v:true
    execute('Goyo')

  " Minimize window, if any has been maximized before.
  else
    let s:window_maximized = v:false
    let l:line = line('.') " Store line, cause exiting maximized window scroll to the top.
    wincmd q
    call win_gotoid(s:maximized_window_id)
    execute(':' . l:line)

  endif
endfunction


" Switch to a vertical or horizontal split between two windows.
" Switching to currently used split results into the equal split.
" This is between the current window and the one window which is focused, when close the active window.
" This function does not adjust the windows height after the switch, cause this can't work correctly.
"
" Arguments:
"   horizontal - Boolean to differ between both layouts.
"
function! utils#windows#switch_window_split(horizontal) abort
  let l:bufnr = bufnr('%')  " Get current buffer number to restore it in the new window.
  if a:horizontal | let l:vert = '' | else | let l:vert = 'vert ' | endif

  " Close current window and open new split with the cached buffer number.
  wincmd c
  execute l:vert . 'sbuffer ' . l:bufnr
endfunction


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


" Internal

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


