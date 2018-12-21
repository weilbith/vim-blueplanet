" Try to expand a snippet after a completion item has been selected.
" This makes sure to expand only if a bunch of conditions are met.
"
function! plugin#ultisnips#try_expand() abort
  " Ignore events without completion item.
  " Check if the completed item is from kind 'snippet'.
  " Check if a at least one completion candidate exists (only one available
  " after completion).
  if !empty(v:completed_item) &&
        \ v:completed_item.kind ==# 'snippet' &&
        \ len(UltiSnips#SnippetsInCurrentScope()) > 0

    call UltiSnips#ExpandSnippet()
  endif
endfunction
