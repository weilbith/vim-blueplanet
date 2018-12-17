" The maximum height for the location window.
let s:location_height = 5

" Dictionary to store location windows related to buffers.
let s:map_buffer_location_list = {}


" Function to jump/open (to) the location window, if currently outside.
" Jump back from the location window, if currently inside.
"
function! utils#location#location_jump() abort
  " Jump back if current buffer in the window is the location or quickfix list.
  if &filetype ==? 'qf'
    wincmd p
    
  " Check is a filled one exists.
  elseif len(getloclist(0)) <= 0
    call utils#messages#warning('Current location list is empty! Go back in history or fill a new one.') 

  " Jump to or open
  else
    execute 'lopen'
  endif
endfunction


" Determine if the window with the given id shows the location list.
"
" Argumens:
"   winid - id of the window to check
"
function! utils#location#is_location_window(winid) abort
  let l:dict = getwininfo(a:winid)
  if len(l:dict) > 0 && get(l:dict[0], 'quickfix', 0) && get(l:dict[0], 'loclist', 0)
    return v:true
  else
    return v:false
  endif
endfunction


" Remove the current entry from the location list.
" Uses the list of the current window to keep it easy.
"
function! utils#location#remove_current_entry() abort
  " if !utils#location#is_location_window(win_getid()) | return | endif

  let l:index = line('.') - 1
  let l:list = getloclist(0)
  call remove(l:list, l:index)
  call setloclist(0, l:list, 'r')
endfunction


" Shrink the window height of the location window.
" Use one line higher then entries in the location list, to show one empty
" line that this is all in the list.
" If the location list is longer than a configured number, it takes this
" maximum height.
"
function! utils#location#adjust_window_height() abort
  if !utils#location#is_location_window(win_getid()) | return | endif

  let s:location_length = len(getloclist(0))

  if s:location_length > s:location_height
    execute 'resize ' . s:location_height

  else
    execute 'resize ' . (s:location_length + 1)
  endif
endfunction


" Cache a possibly filled location list for a hiding buffer.
" Check if there is a non-empty list for the current buffer.
" Stores the list to the cache and empty the original one.
" The location window will be closed.
"
" Arguments:
"   buffer - buffer to create the cache for
"
function! utils#location#cache_location_list(buffer) abort
  if get(g:, 'dyloc_enable', v:false) | return | endif

  let l:location_list = getloclist(0)

  " Check if something exist to cache.
  if len(l:location_list) > 0
    let s:map_buffer_location_list[a:buffer] = l:location_list " Cache the location list for the buffer.
    call setloclist(0, []) " Remove since else it remains for the next buffer.
    lclose " Close the empty window (will be possibly reopened on restore for new buffer).
  endif
endfunction


" Restore a possibly cached location list for a new displayed buffer.
" Check the cache if a location list has been stored for the buffer.
" If so it fills the list with the stored one and opens the window.
" The cache entry will be removed.
"
" Arguments:
"   buffer - buffer to restore the cache for
"
function! utils#location#restore_location_list(buffer) abort
  if get(g:, 'dyloc_enable', v:false) | return | endif

  " Check cache for the entered buffer.
  if has_key(s:map_buffer_location_list, a:buffer)
    call setloclist(0, s:map_buffer_location_list[a:buffer]) " Restore the location list from cache.
    unlet s:map_buffer_location_list[a:buffer] " Remove cache to avoid reloading.
    lopen " Open the filled window.
    call utils#location#adjust_window_height() " Resize again, since this event comes after the actual one.
    wincmd p " Jump back from location list to actual window.
  endif
endfunction


" Close the location window for the current window.
" Try it only, if the window is not the location window itself.
" Does nothing if there is no location window open.
"
function! utils#location#close_related_location_window() abort
  if &filetype !=# 'qf'
    silent! lclose
  endif
endfunction
