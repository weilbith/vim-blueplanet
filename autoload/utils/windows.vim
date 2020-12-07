" Change the size of the active window by a user input.
" There are two modes 'height' and 'width', which is selected by the user.
" The user input is used as set to a fixed width/height by a plain number,
" or a relative in-/decrease of the current width/height by prefix a '+' or '-'.
" The procedure can be interrupted by hitting <Esc>.
" Furthermore it shows the current width or height in brackets.
"
function! utils#windows#windowChangeSize() abort
  let l:mode = inputlist(['1 - width', '2 - height']) ==# 1 ? 'width' : 'height'

  " Set the vertical parameter if the width should be changed.
  let l:vertical = l:mode ==# 'width' ? 'vertical ' : ''

  " Get the current window width/height.\
  let l:size = winheight('%')
  if l:mode ==# 'width' | let l:size = winwidth('%') | endif

  " Request user for the adjustment.
  let l:change = input('In-/Decrease by (+/- number) or set to fix width/height (number) [' . l:size .']: ')

  " End here, if no input has given.
  if l:change ==# '' | return | endif

  " Change windows size.
  execute l:vertical . 'resize ' . l:change
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
