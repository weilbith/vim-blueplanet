" Return the fold level for the `foldexpr` option.
" Checks if the current line is a header.
" The level is equal to the number of hashes of the header.
" All lines which are not a header have the same level as their predecessor.
"
function! s:FoldExpr()
  " Check if current line is a header.
  let l:line = getline(v:lnum)
  let l:count = len(matchstr(l:line, '^#\+'))

  " Start new fold section herer.
  if l:count > 0
    return '>1'
  endif

  " Check if next line is a header.
  let l:line = getline(v:lnum + 1)
  let l:count = len(matchstr(l:line, '^#\+'))

  " End last section here before the next.
  if l:count > 0
    return '0'

  " Part of the section.
  else
    return '='
  endif
endfunction


" Generate the folds text for the `foldtext` option.
" Simply use the first line (which should contain the header)
" and extend it by the number of lines in this section.
"
function! s:FoldText()
  let l:title = getline(v:foldstart)
  let l:line_count = (v:foldend - v:foldstart)
  let l:line_text = l:line_count > 1 ? 'lines' : 'line'
  let l:text = l:title . ' [' . l:line_count . ' ' . l:line_text . ']'
  return l:text
endfunction


" Use custom fold expression and text.
setlocal foldmethod=expr
let b:undo_ftplugin .= '|setlocal foldmethod<'

setlocal foldexpr=FoldExpr()
let b:undo_ftplugin .= '|setlocal foldexpr<'

setlocal foldtext=FoldText()
let b:undo_ftplugin .= '|setlocal foldtext<'


" Fold everything per default.
setlocal foldlevel=0
let b:undo_ftplugin .= '|setlocal foldlevel<'

setlocal foldminlines=0
let b:undo_ftplugin .= '|setlocal foldtext<'

