" Show a message and highlight it with the warning group.
function! utilities#show_warning_message(message) abort
  echohl WarningMsg | echo a:message | echohl None
endfunction


" Get the text from the current visual selection.
" Show a warning, if more than one line is selected.
"
function! utilities#get_visual_selection() abort
  " Get the selected range.
  let [l:line_start, l:column_start] = getpos("'<")[1:2]
  let [l:line_end, l:column_end] = getpos("'>")[1:2]

  " Make sure to not have multiple lines.
  if l:line_end > l:line_start
    call utilities#show_warning_message("Refactor multiple lines is not allowed!")
    return
  endif

  " Get the lines content and cut of the outside columns.
  let l:line = getline(l:line_start)
  let l:text = l:line[(l:column_start -1):(l:column_end -1)]
  return l:text
endfunction
