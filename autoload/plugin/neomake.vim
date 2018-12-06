" List of linters to use for javascript languages.
" First entry is the variable name for the NeoMake setting.
" Second entry is the name of the binary.
" Third entry is used to backup settings between changes.
let s:js_linter = [
      \   ['neomake_javascript_eslint_exe', 'eslint', ''],
      \   ['neomake_typescript_tslint_exe', 'tslint', '']
      \ ]


" Determine if the current device is running on battery.
" Hardy depends on the device and OS!!!
"
function! plugin#neomake#is_on_battery() abort
  return readfile('/sys/class/power_supply/AC/online') == ['0']
endfunction

"
" Function to switch the linter executable for javascript languages.
" This is necessary to call the project local linter with its configuration.
" Will be used by an auto command to switch this automatically.
"
function! plugin#neomake#switch_js_linter() abort
  for l:linter in s:js_linter
    " The theoretically path to the linter binaries.
    let l:binaries = getcwd() . '/node_modules/.bin/' . l:linter[1]
    let l:readable = filereadable(l:binaries)

    " Check if the binaries exists and use it then.
    if l:readable
      let l:current = get(g:, l:linter[0], '')

      " Backup the old setting if it exists.
      if len(l:current) > 0
        let l:linter[2] = l:current
      endif

      " Set the binaries to use as executable.
      execute 'let g:' . l:linter[0] . ' = "' . l:binaries . '"'

    " Reset the executable to the global one if has been scoped local before.
    elseif len(l:linter[2]) > 0
      execute 'let g:' . l:linter[0] . ' = "' . l:linter[2] . '"'
      let l:linter[2] = ''

    endif
  endfor
endfunction
