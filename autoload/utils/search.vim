" Stores the current visual selection to the search register.
" This applies some minor optimization.
"
function! utils#search#visual_selection_to_search_register() abort
  let l:selection = utils#msc#get_visual_selection()
  let l:selection = '\V' . substitute(l:selection, '\n', '\\n', 'g')
  let @/ = l:selection
endfunction
