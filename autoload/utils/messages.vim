" Show a message and highlight it with the warning group.
function! messages#warning(message) abort
  echohl WarningMsg | echo a:message | echohl None
endfunction
