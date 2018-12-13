" Format the current buffer.
" The changes done by the formatting are combined with undojoin to have
" a clean history to work with.
" All folds will be cached and restored afterwards, so all opened ones are
" open gain and the cursor is at the correct location.
" Don't do a thing if the buffer has set the flag to disable.
"
function! plugin#neoformat#format_buffer() abort
  if !get(b:, 'neoformat_disable', v:false) | return | endif

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
