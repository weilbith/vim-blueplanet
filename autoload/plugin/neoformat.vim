" Format the current buffer.
" The changes done by the formatting are combined with undojoin to have
" a clean history to work with.
" All folds will be cached and restored afterwards, so all opened ones are
" open gain and the cursor is at the correct location.
"
function! plugin#neoformat#format_buffer() abort
  mkview

  try
    undojoin
    Neoformat

  catch /^Vim\%((\a\+)\)\=:E790/

  finally
    silent Neoformat
  endtry

  loadview
endfunction
