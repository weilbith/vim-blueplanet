" Remove current entry under cursor.
" Differ between quickfix and location lists.
"
if !utils#location#is_location_window(win_getid())
  map <buffer> dd <cmd>call utils#quickfix#remove_current_entry()<CR>

else
  map <buffer> dd <cmd>call utils#location#remove_current_entry()<CR>

endif

let b:undo_ftplugin .= '|unmap <buffer> dd'
