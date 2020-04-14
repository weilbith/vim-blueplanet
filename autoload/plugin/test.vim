let s:simple_shell = '/bin/bash'
let s:floaterm_call = 'FloatermNew '
let s:input_request = "read -n1 -p \"Press 'c' to investigate. Else close...\""
let s:check_for_exit_command = "test \"$REPLY\" != 'c' && exit || echo '\n'"

function! plugin#test#floaterm_strategy(cmd) abort
  let l:backup_shell_option = &shell
  execute 'set shell=' . s:simple_shell
  execute s:floaterm_call . a:cmd . ';' . s:input_request . ';' . s:check_for_exit_command
  execute 'set shell=' . l:backup_shell_option
endfunction

