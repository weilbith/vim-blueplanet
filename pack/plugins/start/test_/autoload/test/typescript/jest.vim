if !exists('g:test#typescript#jest#file_pattern')
  let g:test#typescript#jest#file_pattern = '.spec\.ts$'
endif

if !exists('g:test#typescript#patterns')
  let g:test#typescript#patterns = g:test#javascript#patterns
endif

function! test#typescript#jest#test_file(file) abort
  let l:has_jest = test#javascript#has_package('jest')
        \ && test#javascript#has_package('ts-jest')
  let l:has_vue_jest = test#javascript#has_package('vue-jest')
  return a:file =~# g:test#typescript#jest#file_pattern
    \ && (l:has_jest || l:has_vue_jest)
endfunction

function! test#typescript#jest#build_position(type, position) abort
  return test#javascript#jest#build_position(a:type, a:position)
endfunction

function! test#typescript#jest#build_args(args) abort
  return test#javascript#jest#build_args(a:args)
endfunction

function! test#typescript#jest#executable() abort
  let l:jest_command = 'jest'

  if filereadable('node_modules/.bin/jest')
    let l:jest_command = 'node_modules/.bin/jest'
  endif

  return l:jest_command . ' --coverage=false'
endfunction
