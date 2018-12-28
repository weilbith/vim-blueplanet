scriptencoding utf-8

" Conditions

" Indicates if the current window is pretty narrow.
" Used to disable segments in such case.
"
function! plugin#lightline#tiny_window() abort
  return winwidth(0) < 50
endfunction


" Indicates if the current window is a special one.
" Used to differ the segments in such case.
"
function! plugin#lightline#special_window() abort
  return
          \ &filetype ==# 'tagbar' ||
          \ &filetype ==# 'nerdtree' ||
          \ &filetype ==# 'undotree' ||
          \ &filetype ==# 'tabman' ||
          \ &filetype ==# 'twiggy' ||
          \ &filetype ==# 'help' ||
          \ &filetype ==# 'gitcommit' ||
          \ &filetype ==# 'denite' ||
          \ &filetype ==# 'agit'
endfunction


" Indicates if the current window is the preview window.
" Used to differ the segments in such case.
"
function! plugin#lightline#preview_window() abort
  return &previewwindow
endfunction


" Indicates if the current window is the Denite window.
" Used to differ the segments in such case.
"
function! plugin#lightline#denite_window() abort
  return &filetype ==# 'denite'
endfunction

" Implementations

" Indicates the current window number.
"
function! plugin#lightline#window_number() abort
  return ' ' . winnr()
endfunction


" The current mode or the name of a special buffer.
"
function! plugin#lightline#mode() abort
  if  plugin#lightline#denite_window()
    return substitute(denite#get_status_mode(), '-', '', 'g')

  elseif plugin#lightline#special_window()
    return
          \ &filetype ==# 'tagbar' ? 'Tagbar' :
          \ &filetype ==# 'nerdtree' ? 'NERDTree' :
          \ &filetype ==# 'undotree' ? 'UndoTree' :
          \ &filetype ==# 'tabman' ? 'TabMan':
          \ &filetype ==# 'twiggy' ? 'Twiggy':
          \ &filetype ==# 'help' ? 'Help' : 
          \ &filetype ==# 'gitcommit' ? 'Git Commit' :
          \ &filetype ==# 'agit' ? 'Git Log' : ''
 
  elseif plugin#lightline#preview_window()
    return 'Preview'

  else
    return lightline#mode()
  endif
endfunction


" The name of the git branch.
" Empty if not being in a git repository, a too narrow window
" or a special window.
"
function! plugin#lightline#git_branch() abort
  let l:branch_name = fugitive#head()

  if 
        \ plugin#lightline#tiny_window() ||
        \ plugin#lightline#special_window() ||
        \ plugin#lightline#preview_window() ||
        \ empty(l:branch_name)
    
    return ''
  endif

  return ' ' . l:branch_name
endfunction


" Indicates how many lines have been added, adjusted and deleted.
" Empty if not being in a git repository, a too narrow window,
" a special window or the preview window.
" If nothing has been adjusted at all, a check mark show the state.
"
function! plugin#lightline#git_changes() abort
  if 
        \ plugin#lightline#tiny_window() ||
        \ plugin#lightline#special_window() ||
        \ plugin#lightline#preview_window() ||
        \ empty(fugitive#head())
    
    return ''
  endif

  let [ l:added, l:modified, l:deleted ] = sy#repo#get_stats()
  
  if l:added + l:modified + l:deleted > 0
    return ' ' . l:added . '   ' . l:modified . '   ' . l:deleted

  else
    return ''
  endif
endfunction


" Indicate if the paste mode is enabled.
" Empty if window is too narrow, it is a special one,
" the preview window or the paste mode is disabled.
"
function! plugin#lightline#paste_enabled() abort
  if 
        \ plugin#lightline#tiny_window() ||
        \ plugin#lightline#special_window() ||
        \ plugin#lightline#preview_window() ||
        \ !&paste
    
    return ''
  endif

  return ''
endfunction


" Indicate if the window is in diff-mode.
" Empty if window is too narrow, it is a special one,
" the preview window or no diff mode is disabled.
"
function! plugin#lightline#diff_mode() abort
  if 
        \ plugin#lightline#tiny_window() ||
        \ plugin#lightline#special_window() ||
        \ plugin#lightline#preview_window() ||
        \ !&diff
    
    return ''
  endif

  return '繁'
endfunction


" Name of the file for active windows.
" Empty if window is too narrow or it is a special one.
"
function! plugin#lightline#file_name_active() abort
  if plugin#lightline#denite_window()
    return denite#get_status_sources()

  elseif plugin#lightline#special_window()
    return ''

  else
    return expand('%:t')
  endif
endfunction


" Name of a special buffer.
" Empty if it is not a special window.
"
function! plugin#lightline#file_name_inactive() abort
  if plugin#lightline#special_window()
    return plugin#lightline#mode()

  elseif plugin#lightline#preview_window()
    return 'Preview  ' . expand('%:t')

  else
    return expand('%:t')
  endif
endfunction


" Shows the status of the tag generation.
" Moreover the tag for the current cursor position is displayed if any.
" Empty if window is too narrow, it is a special one
" or the preview window.
" 
function! plugin#lightline#tags_status() abort
  if 
        \ plugin#lightline#tiny_window() ||
        \ plugin#lightline#special_window() ||
        \ plugin#lightline#preview_window()
    
    return ''
  endif

  let l:generating = !empty(gutentags#statusline('a'))
  let l:status = l:generating ? '羽' : ''
  let l:current_tag = tagbar#currenttag(' %s', '')
  return ' ' . l:status . l:current_tag
endfunction


" Indicate if the buffers file has been modified.
" Empty if window is too narrow, it is a special one,
" the preview window or the buffer has not been modified.
"
function! plugin#lightline#modified() abort
  if 
        \ plugin#lightline#tiny_window() ||
        \ plugin#lightline#special_window() ||
        \ plugin#lightline#preview_window() ||
        \ !&modified
    
    return ''
  endif

  return ''
endfunction


" Indicate if the buffers file is read only.
" Empty if window is too narrow, it is a special one
" or the buffer is editable.
"
function! plugin#lightline#read_only() abort
  if 
        \ plugin#lightline#tiny_window() ||
        \ plugin#lightline#special_window() ||
        \ !&readonly
    
    return ''
  endif

  return ''
endfunction


" Summarize the results of the linter checks.
" Empty if window is too narrow, it is a special oner,
" the preview window or all checks were positive.
" 
function! plugin#lightline#linter_status() abort
  if 
        \ plugin#lightline#tiny_window() ||
        \ plugin#lightline#special_window() ||
        \ plugin#lightline#preview_window()
    
    return ''
  endif

  let l:numbers = neomake#statusline#LoclistCounts()
  let l:errors   = has_key(l:numbers, 'E') ? ' ' . l:numbers['E'] : ''
  let l:warnings = has_key(l:numbers, 'W') ? ' ' . l:numbers['W'] : ''
  let l:ignore   = has_key(l:numbers, 'x') ? ' ' . l:numbers['x'] : ''
  return l:errors . ( l:errors && l:warnings ? '  ' : '' ) . l:warnings . ( l:warnings && l:ignore ? '  ' : '' ) . l:ignore
endfunction


" Indicate the set file format with an additional icon.
" Empty if window is too narrow or it is a special one.
"
function! plugin#lightline#file_format() abort
  if 
        \ plugin#lightline#tiny_window() ||
        \ plugin#lightline#special_window()
    
    return ''
  endif

  return &fileencoding
endfunction


" Indicate the files type with an additional icon.
" Empty if window is too narrow or it is a special one.
"
function! plugin#lightline#file_type() abort
  if 
        \ plugin#lightline#tiny_window() ||
        \ plugin#lightline#special_window()
    
    return ''
  endif

  return &filetype . ' ' . WebDevIconsGetFileTypeSymbol()
endfunction


" Indicate the set file encoding.
" Empty if window is too narrow or it is a special one.
"
function! plugin#lightline#file_encoding() abort
  if 
        \ plugin#lightline#tiny_window() ||
        \ plugin#lightline#special_window()
    
    return ''
  endif

  return &fileencoding
endfunction


" Show the current language and indicate if spell check is enabled.
" Empty if window is too narrow or it is a special one.
" 
function! plugin#lightline#spell() abort
  if 
        \ plugin#lightline#tiny_window() ||
        \ plugin#lightline#special_window()
    
    return ''
  endif

  return &spelllang . ' ﬜' . (&spell ?  ' ' : ' ')
endfunction


" Show the current language and indicate if spell check is enabled.
" Empty if window is too narrow or it is a special one.
" Help buffers are excluded here.
" 
function! plugin#lightline#position() abort
  if 
        \ plugin#lightline#tiny_window() ||
        \ (plugin#lightline#special_window() &&
        \ &filetype !=# 'help')
    
    return ''
  endif

  return line('.') . '/' . line('$') .  ' '
endfunction


" Status lines for other plugins.

" Tagbar window status line.
"
function! plugin#lightline#tagbar_status(current, sort, fname, ...) abort
  let g:lightline#fname = a:fname
  return lightline#statusline(0)
endfunction
