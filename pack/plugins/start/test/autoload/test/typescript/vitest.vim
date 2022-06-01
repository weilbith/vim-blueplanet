if !exists('g:test#typescript#vitest#file_pattern')
  let g:test#typescript#vitest#file_pattern = '.spec\.ts$'
endif

if !exists('g:test#typescript#patterns')
  let g:test#typescript#patterns = g:test#javascript#patterns
endif

function! test#typescript#vitest#test_file(file) abort
  let l:has_vitest = test#javascript#has_package('vitest')
  return a:file =~# g:test#typescript#vitest#file_pattern
    \ && l:has_vitest
endfunction

function! test#typescript#vitest#build_position(type, position) abort
  if a:type ==# 'nearest'
    let name = s:get_full_test_name(a:position)
    let escaped_name = escape(shellescape(name, 1), '()')
    let filter = '-t ' . escaped_name
    return ['--no-coverage', filter, a:position['file']]
  elseif a:type ==# 'file'
    return ['--no-coverage', a:position['file']]
  else
    return []
  endif
endfunction

function! test#typescript#vitest#build_args(args) abort
  return a:args
endfunction

function! test#typescript#vitest#executable() abort
  if filereadable('node_modules/.bin/vitest')
    return 'node_modules/.bin/vitest run'
  else
   return 'vitest run'
  endif
endfunction

function! s:get_full_test_name(position) abort
  let nearest_test = test#base#nearest_test(a:position, g:test#javascript#patterns)
  let full_test_name = ''

  for namespace in nearest_test['namespace']
    let full_test_name = full_test_name . namespace . ' '
  endfor

  for test in nearest_test['test']
    let full_test_name = full_test_name . test . ' '
  endfor

  return trim(full_test_name)
endfunction
