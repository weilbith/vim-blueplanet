scriptencoding utf-8

" Variables

let s:number_map =
      \ {
      \   0: '⓿ ', 1: '❶ ', 2: '❷ ', 3: '❸ ', 4: '❹ ',
      \   5: '❺ ', 6: '❻ ', 7: '❼ ', 8: '❽ ', 9: '❾ '
      \ }

let plugin#lightline#number_map = s:number_map


" Conditions

" Indicates if the current window is medium width.
" Used to shrink segments content.
"
function! plugin#lightline#medium_window() abort
  return winwidth(0) < 150
endfunction


" Indicates if the current window is very narrow.
" Used to shrink even more content.
"
function! plugin#lightline#small_window() abort
  return winwidth(0) < 100
endfunction


" Indicates if the current window is super slim.
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
          \ &filetype ==# 'nerdtree' ||
          \ &filetype ==# 'undotree' ||
          \ &filetype ==# 'help' ||
          \ &filetype ==# 'gitcommit' ||
          \ &filetype ==# 'startify' ||
          \ &filetype ==# 'snippets' ||
          \ &filetype ==# 'trans' ||
          \ &filetype ==# 'far_vim' ||
          \ bufname('%') ==# '[Grammarous]' ||
          \ bufname('%') ==# '__Scratch__' ||
          \ bufname('%') ==# '__vista__' ||
          \ utils#location#is_location_window(win_getid()) ||
          \ &filetype ==# 'qf' ||
          \ s:is_diff_window()
endfunction


" Indicates if the current window is the preview window.
" Used to differ the segments in such case.
"
function! plugin#lightline#preview_window() abort
  return &previewwindow
endfunction


" Utilities

" Take a text and abbreviate it by replacing its middle with a sign.
" The length will be truncated to a constant length of the given threshold.
" Nevertheless the length will be slightly shorter, to avoid that only one
" single character in the middle the cut out.
" In case the given text is short enough, the original will be returned.
"
" Arguments:
"   text   - the text which will be abbreviated
"   length - static length for the abbreviation
"
function! plugin#lightline#abbreviate(text, length) abort
  if strlen(a:text) <= a:length
    return a:text
  endif

  let l:buffer     = 2
  let l:length     = a:length / 2
  let l:text_start = a:text[:(l:length - l:buffer)]
  let l:text_end   = a:text[(strlen(a:text) - l:length + l:buffer):]
  return l:text_start . '' . l:text_end
endfunction


" Build a good looking file path representation.
" The path until the file name gets shorten.
" Additionally if the window is small, the file name gets abbreviated if it is
" too long.
" Is working on the current window and the displayed buffers file.
"
function! plugin#lightline#fancy_file_path() abort
  let l:path = pathshorten(expand('%:h') . '/')
  let l:file_name = expand('%:t')
  let l:length = 30 - strlen(l:path)

  " Short the file name for small windows if a threshold is exceeded.
  if plugin#lightline#medium_window()
    let l:file_name = plugin#lightline#abbreviate(l:file_name, l:length)
  endif

  return l:path . l:file_name
endfunction


" Segment Implementations

" Indicates the current window number.
"
function! plugin#lightline#window_number() abort
  let l:window_number = winnr()

  if has_key(s:number_map, l:window_number)
    let l:window_number = s:number_map[l:window_number]
  endif

  return ' ' . l:window_number
endfunction


" The current mode or the name of a special buffer.
" In case the window is small, only the first character of the modes name is
" displayed.
"
function! plugin#lightline#mode() abort
  let l:submode = ''

  if exists('*submode#current')
    let l:submode = submode#current()
  endi

  if plugin#lightline#special_window()
    return
          \ &filetype ==# 'nerdtree' ? 'NERDTree' :
          \ &filetype ==# 'undotree' ? 'UndoTree' :
          \ &filetype ==# 'help' ? 'Help' :
          \ &filetype ==# 'gitcommit' ? 'Git Commit' :
          \ &filetype ==# 'startify' ? 'Startify' :
          \ &filetype ==# 'snippets' ? 'Snippet' :
          \ &filetype ==# 'trans' ? 'Translation' :
          \ &filetype ==# 'far' ? 'Find & Replace' :
          \ bufname('%') ==# '[Grammarous]' ? 'Grammarous' :
          \ bufname('%') ==# '__Scratch__' ? 'Scratch' :
          \ bufname('%') ==# '__vista__' ? 'Vista' :
          \ utils#location#is_location_window(win_getid()) ? 'Location List' :
          \ &filetype ==# 'qf' ? 'Quickfix List' :
          \ s:is_diff_window() ? s:get_diff_window_name() : ''

  elseif plugin#lightline#preview_window()
    return 'Preview'

  elseif !empty(l:submode)
    return l:submode

  else
    let l:mode = lightline#mode()

    if plugin#lightline#small_window()
      return l:mode[:0]

    else
      return l:mode
    endif
  endif
endfunction


" The name of the git branch.
" Empty if not being in a git repository, a too narrow window
" or a special window.
" The text gets abbreviated, if the window is small.
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

  if plugin#lightline#medium_window()
    let l:branch_name = plugin#lightline#abbreviate(l:branch_name, 25)
  endif

  return ' ' . l:branch_name
endfunction


function! plugin#lightline#git_changes() abort
  let [ l:added_count, l:modified_count, l:deleted_count ] = sy#repo#get_stats()
  let l:sum_of_changes = l:added_count + l:modified_count + l:deleted_count

  if
        \ plugin#lightline#tiny_window() ||
        \ plugin#lightline#special_window() ||
        \ plugin#lightline#preview_window() ||
        \ empty(fugitive#head()) ||
        \ l:sum_of_changes <= 0
    return ''
  else
    return ' ' . l:sum_of_changes
  endif
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
" The text gets abbreviated, if the window is small.
" Shows diff mode window names.
"
function! plugin#lightline#file_name_active() abort
  if plugin#lightline#special_window()
    if s:is_diff_window()
      return s:get_diff_window_name()

    else
      return ''

    endif

  else
    return ' ' . plugin#lightline#fancy_file_path()
  endif
endfunction


" Name of a special buffer.
" Empty if it is not a special window.
"
function! plugin#lightline#file_name_inactive() abort
  if plugin#lightline#special_window()
    return plugin#lightline#mode()

  elseif plugin#lightline#preview_window()
    return 'Preview  ' . plugin#lightline#fancy_file_path()

  else
    let l:path = plugin#lightline#fancy_file_path()
    let l:modified = plugin#lightline#modified()
    return l:path . (len(l:modified) > 0 ? ' ' : '') . l:modified
  endif
endfunction


function! plugin#lightline#tags_status() abort
  if
        \ plugin#lightline#tiny_window() ||
        \ plugin#lightline#special_window() ||
        \ plugin#lightline#preview_window() ||
        \ g:gutentags_enabled != 1
    return ''
  endif

  return !empty(gutentags#statusline('a')) ? ' 羽' : ''
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

function! plugin#lightline#treesitter() abort
  let l:location = 'null'

  try
    let l:location = nvim_treesitter#statusline()
  catch
    echom 'Failed to get status line content by tree sitter'
  endtry

  if l:location ==# 'null'
    return ''
  endif

  let l:length = plugin#lightline#small_window() ? 20 : plugin#lightline#medium_window() ? 50 : 80

  if strlen(l:location) > l:length
    let l:location = l:location[:l:length -2] . ' '
  endif

  return ' ' . l:location
endfunction

function! plugin#lightline#diagnostics() abort
  let l:error_count = luaeval('vim.lsp.diagnostic.get_count(0, "Error")')
  let l:warning_count = luaeval('vim.lsp.diagnostic.get_count(0, "Warning")')
  let l:absolute_count = l:error_count + l:warning_count

  return l:absolute_count > 0 ? l:absolute_count . ' ' : ''
endfunction


function! plugin#lightline#file_format() abort
  if
        \ plugin#lightline#tiny_window() ||
        \ plugin#lightline#special_window()

    return ''
  endif

  return WebDevIconsGetFileFormatSymbol()
endfunction


function! plugin#lightline#file_type() abort
  if
        \ plugin#lightline#tiny_window() ||
        \ plugin#lightline#special_window()

    return ''
  endif

  return WebDevIconsGetFileTypeSymbol()
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
" Reduces to the icon only, if the window is small.
"
function! plugin#lightline#spell() abort
  if
        \ plugin#lightline#tiny_window() ||
        \ plugin#lightline#special_window()

    return ''
  endif

  let l:condition = !plugin#lightline#medium_window()
  let l:text      = &spelllang
  let l:icon      = &spell ? '' : ''

  return (l:condition ? l:text . ' ' : '') . l:icon
endfunction


" Show the current language and indicate if spell check is enabled.
" Empty if window is too narrow or it is a special one.
" Help, quickfix and location list buffers are excluded here.
"
function! plugin#lightline#position() abort
  if
        \ plugin#lightline#tiny_window() ||
        \ (plugin#lightline#special_window() &&
        \ &filetype !=# 'help' && &filetype !=# 'qf')

    return ''
  endif

  return line('.') . '/' . line('$') .  ' '
endfunction


" Show the name of the tab page with the given number.
" Work in combination with named tabs.
" The text gets abbreviated, if the window is small.
"
function! plugin#lightline#tab_name(count) abort
  let l:name = utils#tabs#get_name(a:count)
  let l:name = plugin#lightline#abbreviate(l:name, 20)
  return l:name
endfunction


" Internal

" Determine if the window is part of a fugitive diff.
function! s:is_diff_window() abort
  return expand('%') =~? 'fugitive:.*\/\.git'
endfunction


" Return name of the window in the diff.
" Distinct between the LOCAL and REMOTE window.
"
function! s:get_diff_window_name() abort
  return expand('%') =~? '\/\.git\/\/2' ? 'LOCAL' : 'REMOTE'
endfunction
