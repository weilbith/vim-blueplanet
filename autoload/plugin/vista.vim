let s:max_columns = 130
let s:manual_opened = v:false


" Toggle the Vista window.
" This toggled additionally the local flag that it has been opened or closed.
" Do not use the default toggle command, since the flag must been set precise.
" And cause the resize event could close the Vista for missing space, but the
" user reopen it manually, the flag would signal it is closed, even though it
" is open.
"
function! plugin#vista#toggle() abort
  windo if bufname('%') ==# '__vista__' | let g:vista_win_id = win_getid() | endif

  if get(g:, 'vista_win_id', -1) > 0
    call vista#(1) " 1 means closed
    let s:manual_opened = v:false
    unlet g:vista_win_id

  else
    call vista#(0) " 2 means open
    let s:manual_opened = v:true
  endif
endfunction


" Check the current width of Vim and close or reopen Vista window.
" Will only do something if it has been opened before manually.
"
function! plugin#vista#hide_show() abort
  echom s:manual_opened

  if s:manual_opened
    if &columns >= s:max_columns
      call vista#(0) " 0 means open
      wincmd p

    else
      call vista#(1) " 1 means close
    endif
  endif
endfunction
