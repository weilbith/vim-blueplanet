" Jump to an entry of the jump history.
" Interactive selecting while showing the history.
" Forward jumping indicated by a prefix.
"
function! utils#jump#jump_by_history() abort
  " Show jump history and ask for index.
  jumps
  let l:index = input('Select history index to jump: ')
  
  " Quit input was empty.
  if l:index ==# '' | return | endif
  
  " Indicate direction to jump by a '+' prefix.
  let l:pattern = '\v\c^\+'
  
  if l:index =~ pattern
    " Remove the prefix.
    let l:index = substitute(l:index, l:pattern, '', 'g')
    execute 'normal ' . l:index . "\<C-I>"
  
  else
    execute 'normal ' . l:index . "\<C-O>"
  endif
endfunction
