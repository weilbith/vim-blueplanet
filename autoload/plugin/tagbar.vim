let s:max_columns = 170
let s:manual_opened = v:false


" Toggle the Tagbar window.
" This toggled additionally the local flag that it has been opened or closed.
" Do not use the default toggle command, since the flag must been set precise.
" And cause the resize event could close the Tagbar for missing space, but the
" user reopen it manually, the flag would signal it is closed, even though it
" is open.
"
function! plugin#tagbar#toggle() abort
  windo if &filetype ==# 'tagbar' | let g:tagbar_win_id = win_getid() | endif

  if get(g:, 'tagbar_win_id', -1) > 0
    call tagbar#CloseWindow()
    let s:manual_opened = v:false
    unlet g:tagbar_win_id

  else
    call tagbar#OpenWindow()
    let s:manual_opened = v:true
  endif
endfunction


" Check the current width of Vim and close or reopen Tagbar window.
" Will only do something if it has been opened before manually.
"
function! plugin#tagbar#hide_show() abort
  echom s:manual_opened

  if s:manual_opened
    if &columns >= s:max_columns
      call tagbar#OpenWindow()
      wincmd p

    else
      call tagbar#CloseWindow()
    endif
  endif
endfunction
