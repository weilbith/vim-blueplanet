scriptencoding utf-8

" Get the text from the current visual selection.
" Show a warning, if more than one line is selected.
"
function! utils#msc#get_visual_selection() abort
  " Get the selected range.
  let [l:line_start, l:column_start] = getpos("'<")[1:2]
  let [l:line_end, l:column_end] = getpos("'>")[1:2]

  " Make sure to not have multiple lines.
  if l:line_end > l:line_start
    call utils#messages#warning('Refactor multiple lines is not allowed!')
    return
  endif

  " Get the lines content and cut of the outside columns.
  let l:line = getline(l:line_start)
  let l:text = l:line[(l:column_start -1):(l:column_end -1)]
  return l:text
endfunction

" Function to convert a plain number into a number symbol.
" There is the choice between circled number filled out or circled but empty
" and just the number within.
"
" Arguments:
"   number - the number to map
"   filled - if circled should be filled or not
"
function! utils#msc#circle_number(number, filled) abort
  " Define the symbols.
  let l:filled = ['⓿ ', '➊ ', '➋ ', '➌ ', '➍ ', '➎ ', '➏ ', '➐ ', '➑ ', '➒ ']
  let l:empty = ['🄋 ', '➀ ', '➁ ', '➂ ', '➃ ', '➄ ', '➅ ', '➆ ', '➇ ', '➈ ']

  " Return the original number in case its out of range.
  if a:number < 0 || a:number >= 10
    return a:number

  " Return the filled or empty symbol.
  elseif a:filled
    return l:filled[a:number]

  else
    return l:empty[a:number]

  endif
endfunction


" Restore cursor position from last time editing opened file.
"
function! utils#msc#restore_cursor_position() abort
  if line("'\"") > 1 && line("'\"") <= line('$') |
    execute "normal!  g'\""
  end
endfunction
