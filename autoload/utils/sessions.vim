" Create a new session.
" Ask the user to enter the name of this session.
"
function! utils#sessions#createNewSession() abort
  let l:name = input('Session Name:')
  execute('SaveSession ' . l:name)
endfunction
