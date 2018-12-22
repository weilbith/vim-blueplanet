" All supported color representation formats with their name and command.
let s:formats = {
      \ 'hex':  '',
      \ 'rgb':  'r',
      \ 'rgba': 'ra',
      \ 'hsl':  'h',
      \ }


function! plugin#vcoolor#choose_color() abort
  " Prepare selection for user.
  let l:selection = []
  let l:index = 0
  let l:names = sort(keys(s:formats))

  for name in l:names
    call add(l:selection, ' ' . (l:index + 1) . ' - ' . name)
    let l:index = l:index + 1
  endfor


  " Request user for output format of the color.
  echo 'Select output format:'
  let l:choice = inputlist(l:selection)
  let l:command = s:formats[l:names[l:choice - 1]]

  " Call vCoolor with the correct command.
  execute empty(l:command) ? 'VCoolor' : 'VCoolIns  ' . l:command
endfunction
