let g:choosewin_blink_on_land=1
let g:choosewin_statusline_replace=1
let g:choosewin_hook = {}

let s:ignore_filtype = ['help', 'LuaTree', 'vista_kind']


" Functions

function! g:choosewin_hook.filter_window(winnums)
  return filter(a:winnums,
        \ 'index(s:ignore_filtype,
        \ getwinvar(v:val, "&filetype")) == -1' )
endfunction
