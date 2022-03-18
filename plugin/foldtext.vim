scriptencoding utf-8

set foldtext=ConstructFoldText()

function ConstructFoldText() abort
  let l:indentation = repeat(' ', indent(v:foldstart))
  let l:start_line = trim(getline(v:foldstart))
  let l:line_count = v:foldend - v:foldstart
  let l:end_line = trim(getline(v:foldend))

  return l:indentation .. ' ' .. l:start_line .. '.. ' .. l:line_count .. ' lines ..' .. l:end_line
endfunction
