" The window number for the artificical preview window.
" Use number instead if id, cause the 'close' command don't understand id's.
let s:quickfix_preview_window_nr = ''

" Function to jump/open (to) the quickfix window, if currently outside.
" Jump back from the quickfix window, if currently inside.
function! utils#quickfix#quickfix_jump() abort
  " Check if current buffer in the window is the quickfixlist.
  if &filetype ==# 'qf'
    wincmd p " Jump back
  else
    " Jump to or open
    exe 'copen'
  endif
endfunction


" Open a artificial preview window inside/for the quickfix list.
"
function! utils#quickfix#open_preview_window() abort
  " Do nothing if it is already open.
  if s:quickfix_preview_window_nr | return | endif

  " Jump to the quickfix window if not already inside.
  copen

  " Split vertical on the right side.
  setlocal splitright
  wincmd v

  " Store the window number.
  let s:quickfix_preview_window_nr = winnr()

  " Split from the quickfix window lead to a new empty buffer, which have to
  " be removed.
  let l:tmp_buffer_nr = bufnr('%')
  bnext
  silent execute l:tmp_buffer_nr . 'bdelete!'

  " Go back to quickfix window.
  wincmd p
endfunction


" Opens the file under the cursor in the quickfixlist in the preview window.
"
function! utils#quickfix#show_quickfix_preview() abort
  " Do not proceed if no quickfix or preview window is open.
  if &filetype !=# 'qf' || !s:quickfix_preview_window_nr | return | endif

  " Get the file for the quickfix entry under the cursor.
  let l:entrynr = line('.') -1 " Mind that a list starts with index zero.
  let l:entry = getqflist()[l:entrynr]
  let l:file = getbufinfo(l:entry.bufnr)[0].name
  let l:line = l:entry.lnum
  let l:col = l:entry.col

  " Jump to the preview window and remove the old highlighing
  execute s:quickfix_preview_window_nr . 'wincmd w'
  match none

  " Open the file from the quickfix entry under the cursor in the opened window for previews.
  silent execute 'edit ' . l:file

  " Jump to the line, highlight and center.
  execute l:line
  execute 'match previewLine "\%' . l:line . 'l\%' . l:col . 'c\k*"'
  normal zz

  " Jump back.
  wincmd p
endfunction


" Toggle the quickfix preview window.
" Close only the preview window if is currently open.
" Create a new quickfix preview window and show the currently selected entry,
" if none is open already.
"
function! utils#quickfix#toggle_quickfix_preview() abort
  " Close the quickfix preview if it is open.
  if s:quickfix_preview_window_nr
    call utils#quickfix#quickfix_close(v:false)

  " Open a new quickfix preview and show the currently selected entry.
  else
    call utils#quickfix#open_preview_window()
    call utils#quickfix#show_quickfix_preview()
  endif
endfunction


" Close the quickfix window and a possible preview window.
"
" Arguments:
"   all - boolean if the quickfix window should be closed also
"
function! utils#quickfix#quickfix_close(all) abort
  " Close the preview window if necessary.
  if s:quickfix_preview_window_nr
    execute s:quickfix_preview_window_nr . 'close'
    let s:quickfix_preview_window_nr = ''
  endif

  if a:all
    cclose
  endif
endfunction


" Check if the current window is the artificial quickfix preview window.
"
function! utils#quickfix#is_quickfix_preview_window() abort
  if !s:quickfix_preview_window_nr | return v:false | endif

  if winnr() == s:quickfix_preview_window_nr | return v:true | else | return v:false | endif
endfunction


" Open the buffer that is currently shown in the preview window into
" the currently active window.
"
function! utils#quickfix#open_quickfix_preview_file() abort
  " Not possible if no preview window is open for the quickfix list.
  if !s:quickfix_preview_window_nr
    call utils#messages#warning('No quickfix preview window open!')
    return
  endif

  " Only available in a 'regular' window.
  if winnr() == s:quickfix_preview_window_nr ||
        \ &filetype ==# 'qf' ||
        \ !&buflisted
    call utils#messages#warning('Open preview only possible in regular window!')
    return
  endif

  " Jump to the preview window to get the buffer number.
  execute s:quickfix_preview_window_nr . 'wincmd w'
  let l:bufnr = bufnr('%')
  let l:line = line('.')

  " Go back to the original window and open this buffer with the same line
  " centered.
  wincmd p
  execute l:bufnr . 'buffer'
  execute l:line
  normal zz
endfunction


" Make the scoped variable public available.
"
function! utils#quickfix#get_quickfix_preview_window_nr() abort
  return s:quickfix_preview_window_nr
endfunction

" Remove the current entry from the quickfix list.
"
function! utils#quickfix#remove_current_entry() abort
  let l:index = line('.') - 1
  let l:list = getqflist()
  call remove(l:list, l:index)
  call setqflist(l:list, 'r')
endfunction
