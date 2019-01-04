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


" Jump to the next or previous location list entry based on the cursors current
" position.
" The location list is grouped by files. Within each group the entries are
" sorted ascending by their line and column values. The current position is
" defined by the buffer this is called in and the cursors line and column.
" Therefore the location list get searched first for the group of entries for
" the buffers file. If this has been found, the cursor position is taken into
" account. In case the cursor is before/behind the first/last entry for this
" buffer, a jump to a different file will be caused. To make this clean, the
" user has to confirm the jump.
" If the location list does not contain any entry for the buffers file, a jump
" to the first entry is requested, which will also switch the buffer.
"
"
function! utils#location#find_entry_by_position(...) abort
  let l:list = getloclist(0)

  " Abort if there is not location list.
  if len(l:list) == 0
    call utils#messages#warning('There is no active location list!')
    return
  endif

  let l:backward = get(a:, 1, v:false)
  let l:current_buffer = v:false

  " Iterate over all entries until we find the next or previous one.
  for index in range(0, len(l:list) - 1)
    let l:entry = l:list[index]
    let l:same_buffer = l:entry.bufnr == bufnr(bufname('%'))

    " Check if we reached the first entry for this buffer in the list since it
    " is ordered.
    if !l:current_buffer && l:same_buffer
      let l:current_buffer = v:true

    " Check if the overreached the last entry for this buffer in the list.
    elseif l:current_buffer && !l:same_buffer
      " In this case the last entry was the previous one, since no more entries
      " are within this buffer.
      if l:backward
        execute 'll' . index

      " Next entry is in a new buffer.
      else
        call s:jump_to_other_buffer(l:entry, (l:backward ? 'Previous' : 'Next') . ' entry is in another buffer.')
      endif
      return
    endif

    " Search within the entries of the current buffer.
    if l:current_buffer
      " Check if this is on the same line but at a more right column
      " or in a liner under the current one.
      " In case of backward direction, mention that the cursor could be exactly
      " on one match. To don't land on the same entry again go back.
      if
            \ (l:entry.lnum == line('.') && (l:backward ? l:entry.col >= col('.') : l:entry.col > col('.'))) ||
            \ l:entry.lnum > line('.')

        " Convert list index (which starts at zero) to location list index.
        " Mention the direction to select the next or previous entry.
        let l:real_index = index + (l:backward ? 0 : 1) 

        " Make sure we keep in the bounds.
        if l:real_index <= 0
          call utils#messages#warning('Already on the first entry!')

        else
          execute 'll' . l:real_index
        endif

        return
      endif
    endif
  endfor

  " Run through the whole list.
  if l:current_buffer
    if l:backward
      " Jump to last entry in list.
      execute 'll' . len(l:list)

    else
      " Last entry in list is in current buffer and preceded by cursor position.
      call utils#messages#warning('Already at/behind the last entry!')
    endif

  " No entry for the current buffer in the whole list.
  else
    call s:jump_to_other_buffer(l:list[0], 'No entry for this buffer in the whole list. Start at lists first entry.')
  endif
endfunction


" Internal

" Helper function to interactively jump to a buffer which is not the current.
" The user get requested with a customizable query if he really wants to jump.
" By the given location list entry, the position in the buffer get defined.
"
" Arguments:
"   entry   - entry of the location list to jump to
"   message - message to show on confirmation (gets extended)
"
function! s:jump_to_other_buffer(entry, message) abort
  let l:message = a:message . ' Jump to "' . bufname(a:entry.bufnr) . '"?'
  let l:confirm = confirm(l:message, "yes\n[&no]", 2)

  if l:confirm == 1
    execute 'buffer' . a:entry.bufnr
    call cursor(a:entry.lnum, a:entry.col)
    edit! " 'Enable' the hidden buffer.
  endif
endfunction
