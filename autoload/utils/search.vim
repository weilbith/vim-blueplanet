" Search for the current visual selection for- or backward.
" The operator is related to the search keys.
"
" Arguments:
"   operator - search command to use ('/' or '?').
"
function! utils#search#visual_selection(operator) abort
  let l:selection = utils#msc#get_visual_selection()
  let l:selection = '\V' . substitute(escape(l:selection, a:operator.'\'), '\n', '\\n', 'g')
  execute 'normal ' . a:operator . l:selection
endfunction
