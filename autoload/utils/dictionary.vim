let s:lang_to_dict_list = {}
let s:lang_to_dict_list.en_us = [g:dictionary_folder . '/english.txt']
let s:lang_to_dict_list.de = [g:dictionary_folder . '/german.txt']

function! utils#dictionary#switch_language() abort
  set dictionary=
  call s:add_dict(&spellfile)

  execute 'set dictionary+=' . &spellfile

  if !has_key(s:lang_to_dict_list, &spelllang) | return | endif

  for dict in s:lang_to_dict_list[&spelllang]
    call s:add_dict(dict)
  endfor
endfunction

function! s:add_dict(dict) abort
  if filereadable(a:dict)
    execute 'set dictionary+=' . a:dict
  endif
endfunction
