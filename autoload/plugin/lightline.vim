scriptencoding utf-8

function! plugin#lightline#git_changes() abort
  let [ l:added, l:modified, l:deleted ] = sy#repo#get_stats()
  
  if l:added + l:modified + l:deleted > 0
    return ' ' . l:added . '   ' . l:modified . '   ' . l:deleted

  else
    return ''
  endif
endfunction

function! plugin#lightline#tags_status() abort
  let l:generating = !empty(gutentags#statusline('a'))
  let l:status = l:generating ? '羽' : ''
  let l:current_tag = tagbar#currenttag(' %s', '')
  return ' ' . l:status . l:current_tag
endfunction

function! plugin#lightline#linter_status() abort
  let l:numbers = neomake#statusline#LoclistCounts()
  let l:errors   = has_key(l:numbers, 'E') ? ' ' . l:numbers['E'] : ''
  let l:warnings = has_key(l:numbers, 'W') ? ' ' . l:numbers['W'] : ''
  let l:ignore   = has_key(l:numbers, 'x') ? ' ' . l:numbers['x'] : ''
  return l:errors . ( l:errors && l:warnings ? '  ' : '' ) . l:warnings . ( l:warnings && l:ignore ? '  ' : '' ) . l:ignore
endfunction

function! plugin#lightline#paste_enabled() abort
  return &paste ? '' : ''
endfunction

function! plugin#lightline#modified() abort
  return &modified ? '' : ''
endfunction

function! plugin#lightline#read_only() abort
  return &readonly ? '' : ''
endfunction
