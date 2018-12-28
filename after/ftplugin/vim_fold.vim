" Pattern
let s:pattern_function_augroup_start = '^\(function\|augroup\)!\?\s*\(END\)\@!'
let s:pattern_function_augrup_end = '^\(endfunction\|augroup\sEND\)'


" Generate the folds text for the `foldtext` option.
" Simply use the first line (which should contain the header)
" and extend it by the number of lines in this section.
"
function! FoldText()
  let l:line = getline(v:foldstart)
  let l:title = substitute(l:line, s:pattern_function_augroup_start, '', '') " Get the name after the keyword.
  let l:title = substitute(l:title, '.*\zs(.*', '', '') " Cut of the rest after the name.
  let l:type = l:line =~? '^function' ? 'F' : 'A' " Additionally to the name give a type of it.
  let l:line_count = (v:foldend - v:foldstart)
  let l:line_text = l:line_count > 1 ? 'lines' : 'line'
  let l:text = l:title . ' (' . l:type . ') [' . l:line_count . ' ' . l:line_text . ']'
  return l:text
endfunction


" Return the fold level for the `foldexpr` option.
" Checks if the current line is a header.
" The level is equal to the number of hashes of the header.
" All lines which are not a header have the same level as their predecessor.
"
function! FoldExpr()
  let l:line = getline(v:lnum)

  " Check the end of the function or augroup first, cause the END identifier.
  if l:line =~? s:pattern_function_augrup_end
    return '<1'

  " Check for fold begin of a function or augroup.
  elseif l:line =~? s:pattern_function_augroup_start
    return '>1'


  else
    return '='
  endif
endfunction


" Use custom fold expression and text.
setlocal foldmethod=expr
let b:undo_ftplugin .= '|setlocal foldmethod<'

setlocal foldexpr=FoldExpr()
let b:undo_ftplugin .= '|setlocal foldexpr<'

setlocal foldtext=FoldText()
let b:undo_ftplugin .= '|setlocal foldtext<'


" Fold everything larger than two lines.
setlocal foldlevel=0
let b:undo_ftplugin .= '|setlocal foldlevel<'

setlocal foldminlines=2
let b:undo_ftplugin .= '|setlocal foldminlines<'
