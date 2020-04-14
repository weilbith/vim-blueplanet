function! plugin#info_window#toggle() abort
  call infowindow#toggle({}, { default_lines -> plugin#info_window#extend(default_lines) })
endfunction

function! plugin#info_window#extend(default_lines) abort
  let l:custom_list = [
        \ ['path', expand('%:p:h')],
        \ ['branch', fugitive#head()]
        \ ]
  return extend(a:default_lines, l:custom_list)
endfunction
