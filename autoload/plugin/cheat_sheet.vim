" Set some mappings related to the cheat sheet buffer.
" Since the buffer takes the filtype of the requested language, no own
" filetype can be used.
"
function! plugin#cheat_sheet#add_mappings() abort
  if expand('%') ==# '_cheat'
    " Easily close window.
    nmap <buffer> q :close<CR>

    " Go to next/previous hint.
    nmap <buffer> <leader>n <cmd>call cheat#navigate(1,'S')<CR>
    nmap <buffer> <leader>N <cmd>call cheat#navigate(-1,'S')<CR>
  endif
endfunction
