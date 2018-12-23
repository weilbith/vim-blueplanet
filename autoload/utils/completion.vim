" Call special expansions for some completion types.
" Only do something after a successful completion.
" Depending on the selected item it calls different expansions.
"
function! utils#completion#try_expand() abort
  " Ignore events without completion item.
  if empty(v:completed_item) | return | endif

  " Extend snippets.
  if v:completed_item.kind ==# 'snippet'
    call UltiSnips#ExpandSnippet()
  endif

  " Complete function parameter.
  if v:completed_item.kind ==# 'f' || v:completed_item.kind ==# 'function'
    call feedkeys(cmp#pre_complete('()'))
  endif
endfunction
