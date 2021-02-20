if !exists('g:test#typescript#mocha#file_pattern')
  let g:test#typescript#mocha#file_pattern = '.test\.ts$'
endif

function! test#typescript#mocha#test_file(file) abort
  return a:file =~# g:test#typescript#mocha#file_pattern
    \ && test#javascript#has_package('mocha')
    \ && test#javascript#has_package('ts-node')
endfunction

function! test#typescript#mocha#build_position(type, position) abort
  return test#javascript#mocha#build_position(a:type, a:position)
endfunction

function! test#typescript#mocha#build_args(args) abort
  return test#javascript#mocha#build_args(a:args)
endfunction

function! test#typescript#mocha#executable() abort
  let l:mocha_command = 'mocha'

  if filereadable('node_modules/.bin/mocha')
    let l:mocha_command = 'node_modules/.bin/mocha'
  endif

  return l:mocha_command . ' -r ts-node/register'
endfunction
