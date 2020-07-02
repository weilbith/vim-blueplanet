scriptencoding utf-8

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
