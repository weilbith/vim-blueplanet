" Flag for event composition, if a new buffer has been added into the preview window.
let s:new_preview_flag = v:true


" Check if the preview window is open.
" Return true if so.
"
function! utils#preview_window#is_preview_window_open() abort
  " Try to jump the preview window.
  " Get an error, if there is none.
  try
    " Store current window id to jump back afterwards.
    let l:window = win_getid()
    wincmd P
    call win_gotoid(l:window)
    return v:true
  catch
    return v:false
  endtry
endfunction


" Get the preview windows number.
" Return nothing in case there is no preview window.
"
function! utils#preview_window#get_preview_window_nr() abort
  " Do nothing in case no preview window is active.
  if !utils#preview_window#is_preview_window_open() | return | endif

  " Jump to the preview window, store its id and jump back.
  let l:window = win_getid()
  wincmd P
  let l:preview_window = winnr()
  call win_gotoid(l:window)
  return l:preview_window
endfunction


" Set the new preview flag to true.
" Only if the current buffer is in the preview window.
"
function! utils#preview_window#set_flag() abort
  if &previewwindow
    let s:new_preview_flag = v:true
  endif
endfunction


" Add some settings for the preview buffer.
" Only do something if the new preview flag has been set.
" This includes to wipe the buffer on getting hidden and don't list the
" buffer.
" Mark the buffer for further events as well.
" By this the new preview flag get been removed again.
"
function! utils#preview_window#enable_settings() abort
  if &previewwindow && s:new_preview_flag
    let s:new_preview_flag = v:false
    setlocal nobuflisted
    setlocal bufhidden=wipe
    let b:previewonly = v:true
  endif
endfunction


" Remove some settings for the preview buffer.
" Only do something if the buffer contains the flag to be such one.
" The buffer will be unmarked by this.
"
function! utils#preview_window#disable_settings() abort
  try
    if b:previewonly
      unlet b:previewonly
      setlocal buflisted
      setlocal bufhidden=
    endif
  catch
  endtry
endfunction


" Call wrapper for any command, that can be called with an execute.
" The advantage is, that it temporally reset the preview window.
" This is useful, if the command use the preview window itself, but should create a new temporally one.
" So the active preview window remains the same untouched.
" After the command has finished, the old preview window gets its flag again.
"
" Arguments:
"   cmd - the command to call with execute
"
function! utils#preview_window#call_wrapper(cmd) abort
  " Check if the preview window is open.
  let l:previewOpen = utils#preview_window#is_preview_window_open()

  " Remove the preview window flag from the window and cache its id.
  if l:previewOpen
    wincmd P
    set nopreviewwindow
    let l:previewWinId = win_getid()
  endif

  " Execute Denite with the required source.
  execute(a:cmd)

  " If the preview window was open, jump to old window and reset the flag.
  if l:previewOpen
    call win_gotoid(l:previewWinId)
    set previewwindow
    wincmd p
  endif
endfunction
