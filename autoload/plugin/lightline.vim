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
          \ &filetype ==# 'tabman' ||
          \ &filetype ==# 'twiggy' ||
          \ &filetype ==# 'help' ||
          \ &filetype ==# 'gitcommit' ||
          \ &filetype ==# 'denite' ||
          \ &filetype ==# 'denite-filter' ||
          \ &filetype ==# 'agit' ||
          \ &filetype ==# 'startify' ||
          \ &filetype ==# 'snippets' ||
          \ &filetype ==# 'trans' ||
          \ &filetype ==# 'far_vim' ||
          \ bufname('%') ==# '[YankRing]' ||
          \ bufname('%') ==# '[Grammarous]' ||
          \ bufname('%') ==# '__Scratch__' ||
          \ bufname('%') ==# '_cheat' ||
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
          \ &filetype ==# 'tabman' ? 'TabMan':
          \ &filetype ==# 'twiggy' ? 'Twiggy':
          \ &filetype ==# 'help' ? 'Help' :
          \ &filetype ==# 'gitcommit' ? 'Git Commit' :
          \ &filetype ==# 'agit' ? 'Git Log' :
          \ &filetype ==# 'startify' ? 'Startify' :
          \ &filetype ==# 'snippets' ? 'Snippet' :
          \ &filetype ==# 'trans' ? 'Translation' :
          \ &filetype ==# 'far' ? 'Find & Replace' :
          \ &filetype ==# 'denite' ? 'Denite' :
          \ &filetype ==# 'denite-filter' ? 'Denite Filter' :
          \ bufname('%') ==# '[YankRing]' ? 'Yank Ring' :
          \ bufname('%') ==# '[Grammarous]' ? 'Grammarous' :
          \ bufname('%') ==# '__Scratch__' ? 'Scratch' :
          \ bufname('%') ==# '_cheat' ? 'Cheating' :
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


" Indicates how many lines have been added_count, adjusted and deleted.
" Empty if not being in a git repository, a too narrow window,
" a special window or the preview window.
" The indicator for each stat is displayed only if it has a value above zero.
" For small windows all stats are added to one number and the icons are mixed
" up.
" If nothing has been adjusted at all, a check mark shows the state.
"
function! plugin#lightline#git_changes() abort
  if
        \ plugin#lightline#tiny_window() ||
        \ plugin#lightline#special_window() ||
        \ plugin#lightline#preview_window() ||
        \ empty(fugitive#head())

    return ''
  endif

  let [ l:added_count, l:modified_count, l:deleted_count ] = sy#repo#get_stats()
  let [ l:added_icon, l:modified_icon, l:deleted_icon ] = split(',,', ',')

  if l:added_count + l:modified_count + l:deleted_count > 0
    if plugin#lightline#small_window()
      let l:icons = ''
      let l:count = 0

      let l:icons .= l:added_count > 0 ? l:added_icon : ''
      let l:count += l:added_count

      let l:icons .= l:modified_count > 0 ? l:modified_icon : ''
      let l:count += l:modified_count

      let l:icons .= l:deleted_count > 0 ? l:deleted_icon : ''
      let l:count += l:deleted_count

      return l:icons . ' ' . l:count

    else
      return
            \ (l:added_count > 0 ? l:added_icon . ' ' . l:added_count : '') .
            \ (l:added_count > 0 && l:modified_count > 0 ? '  ' : '') .
            \ (l:modified_count > 0 ? l:modified_icon . ' ' . l:modified_count : '') .
            \ (l:modified_count > 0 && l:deleted_count > 0 ? '  ' : '') .
            \ (l:deleted_count > 0 ? l:deleted_icon . ' ' . l:deleted_count : '')
    endif

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
" The text gets abbreviated, if the window is small.
" Shows diff mode window names.
"
function! plugin#lightline#file_name_active() abort
  if &filetype ==# 'denite' || &filetype ==# 'denite-filter'
    return denite#get_status('sources')

  elseif plugin#lightline#special_window()
    if s:is_diff_window()
      return s:get_diff_window_name()

    else
      return ''

    endif

  else
    return plugin#lightline#fancy_file_path()
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


" Shows the status of the tag generation.
" Moreover the tag for the current cursor position is displayed if any.
" Empty if window is too narrow, it is a special one
" or the preview window.
" Reduces to the icon only, if the window is small.
"
function! plugin#lightline#tags_status() abort
  if
        \ plugin#lightline#tiny_window() ||
        \ plugin#lightline#special_window() ||
        \ plugin#lightline#preview_window()

    return ''
  endif

  let l:condition = !plugin#lightline#medium_window()
  let l:text      = get(b:, 'vista_nearest_method_or_function', '')
  let l:icon      = ' ' . (!empty(gutentags#statusline('a')) ? '羽' : '')


  " Short the file name for small windows if a threshold is exceeded.
  if plugin#lightline#medium_window()
    let l:text = plugin#lightline#abbreviate(l:text, 25)
  endif

  return l:icon . (l:condition ? ' ' . l:text : '')
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
" Reduces to the icon only, if the window is small.
"
function! plugin#lightline#file_format() abort
  if
        \ plugin#lightline#tiny_window() ||
        \ plugin#lightline#special_window()

    return ''
  endif

  let l:condition = !plugin#lightline#medium_window()
  let l:text      = &fileformat
  let l:icon      = WebDevIconsGetFileFormatSymbol()

  return (l:condition ? l:text . ' ' : '') . l:icon
endfunction


" Indicate the files type with an additional icon.
" Empty if window is too narrow or it is a special one.
" Reduces to the icon only, if the window is small.
"
function! plugin#lightline#file_type() abort
  if
        \ plugin#lightline#tiny_window() ||
        \ plugin#lightline#special_window()

    return ''
  endif

  let l:condition = !plugin#lightline#medium_window()
  let l:text      = &filetype
  let l:icon      = WebDevIconsGetFileTypeSymbol()

  return (l:condition ? l:text . ' ' : '') . l:icon
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
  let l:text      = $spelllang
  let l:icon      = '﬜' . (&spell ? ' ' : ' ')

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


" Show the status of the AsyncRun plugin.
" Doesn't show anything if there was never a job.
"
function! plugin#lightline#asyncrun_status() abort
  let l:async_status = get(g:, 'asyncrun_status', '')
  let l:icon = ' '

  if l:async_status ==# 'running'
    return l:icon . '羽'
  elseif l:async_status ==# 'success'
    return l:icon . ''
  elseif l:async_status ==# 'failure'
    return l:icon . ''
  else
    return ''
  endif
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
