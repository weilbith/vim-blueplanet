" List of all windows, which should have a fixed size and/or position.
let s:standard_width = 30
let s:standard_height = 10

let g:layout_fixed_windows = [
      \   {
      \     'preview': 1,
      \     'position': 'K',
      \     'height': &previewheight
      \   },
      \   {
      \     'filetype': 'qf',
      \     'function': ['utils#quickfix#resize_move', 'utils#location#adjust_window_height'],
      \   },
      \   {
      \     'buffer_name': 'YankRing',
      \     'position': 'J',
      \     'height': get(g:, 'yankring_window_height', s:standard_height)
      \   },
      \   {
      \     'buffer_name': 'NERD_tree',
      \     'position': 'H',
      \     'width': get(g:, 'NERDTreeWindowSize', s:standard_width),
      \     'height': 100
      \   },
      \   {
      \     'buffer_name': 'TabManager',
      \     'position': 'H',
      \     'width': get(g:, 'tabman_width', s:standard_width)
      \   },
      \   {
      \     'filetype': 'twiggy',
      \     'position': 'H',
      \     'width': get(g:, 'twiggy_num_columns', s:standard_width)
      \   },
      \   {
      \     'buffer_name': 'undotree_',
      \     'position': 'H',
      \     'width': get(g:, 'undotree_SplitWidth', s:standard_width)
      \   },
      \   {
      \     'buffer_name': '__Tagbar__',
      \     'position': 'L',
      \     'width': get(g:, 'tagbar_width', s:standard_width)
      \   }
      \ ]


" Function which applies the window resizing and positioning for the listed fixed windows.
" It iterates over all entries in the respective list and handle them.
" It try to find a window with the defined properties.
" If such a window could been found for the current entry, if will be resized and positioned.
" For the positioning, mark that the order of the list matter.
"
function! utils#layout#reset_fixed_windows() abort
  let l:window_list = get(g:, 'layout_fixed_windows', [])

  for window in l:window_list
    let l:window_ids = s:get_window_ids(window)

    for id in l:window_ids
      " Apply resizing if window exists.
      if id > 0
        call win_gotoid(id)

        " Apply function call.
        if has_key(window, 'function')
          call s:apply_function(window.function)
        endif

        " Apply positioning.
        if has_key(window, 'position')
          call s:apply_position(window.position)
        endif

        " Apply window height.
        if has_key(window, 'height')
          call s:apply_height(window.height)
        endif

        " Apply window width.
        if has_key(window, 'width')
          call s:apply_width(window.width)
        endif

        " Jump back to original window.
        wincmd p
      endif
    endfor
  endfor
endfunction


" Internal

" Search for a fixed window by its preferences.
" Return a list of window ids if found or empty as non could been found.
" Differ between the three types of 'buffer_name', 'preview' and 'filetype'.
" The 'filetype' property has just a minimal set of use cases (e.g. quickfix window), but
" cause the most delay trough this function, cause all open windows have to be checked.
" Therefore this property should be used rarely to have a nice performance.
"
" Arguments:
"   preferences - the windows preferences used to detect
"
function! s:get_window_ids(preferences) abort
  let l:window_ids = []

  " Property 'buffer_name'.
  if has_key(a:preferences, 'buffer_name')
    " Search for a buffer with the given name as prefix.
    let l:buffer_name = bufname(s:replace_pattern_characters(a:preferences['buffer_name']) . '*')

    if strlen(l:buffer_name) > 0
      " Retrieve the buffer number and in which window it is displayed.
      let l:buffer_number = bufnr(s:replace_pattern_characters(l:buffer_name))
      call add(l:window_ids, bufwinid(l:buffer_number))
    endif
  endif

  " Property 'preview'.
  if has_key(a:preferences, 'preview')
    " Try to jump to the preview window and store its id.
    try
      wincmd P
      call add(l:window_ids, win_getid())
      " Don't jump back here, cause that is useless.
    catch
    endtry
  endif

  " Property 'filetype'.
  if has_key(a:preferences, 'filetype')
    " Check for each window, if the displayed buffer match the file-type.
    " If more than one exits, the last one is used.
    for nr in range(1, winnr('$'))
      if getwinvar(nr, '&filetype') == a:preferences['filetype']
        call add(l:window_ids, win_getid(nr))
      endif
    endfor
  endif

  return l:window_ids
endfunction


" Replace some magic characters within a string pattern.
" This is necessary since the bufnr() and bufwinid() functions use very magic
" patterns, but some buffer names, contain such characters.
"
" Arguments:
"   string - pattern string which to adjust
"
function! s:replace_pattern_characters(string) abort
  let l:string = substitute(a:string, '\[', '\\[', 'g') 
  let l:string = substitute(a:string, '\]', '\\]', 'g') 
  return l:string
endfunction


" Apply the given function(s) for the current window.
" This includes a bunch of sanity checks and a warning messages.
"
" Arguments:
"   function - string as a function reference or a list of such strings
"
function! s:apply_function(function) abort
  let l:function = a:function " Copy argument to be able to overwrite it.

  " Build a list for a single string argument.
  if type(l:function) == v:t_string
    let l:function = [l:function]
  endif

  if type(l:function) == v:t_list
    for entry in l:function
      if type(entry) == v:t_string
        if exists('*' . entry)
          execute 'call ' . entry . '()'
        else
          call utils#messages#warning('Provided function string for layout does not exist: ' . entry)
        endif
      endif
    endfor

  else
    call utils#messages#warning('Could not adjust layout with argument: ' . a:function)

  endif
endfunction


" Apply the given position to move the current window.
" This includes a bunch of sanity checks and a warning message.
"
" Arguments:
"   position - position where to move the window
"
function! s:apply_position(position) abort
  " TODO: Find a match pattern solution instead of this.
  let l:positions = {
        \ 'H': 1, 'J': 1, 'K': 1, 'L': 1
        \ }

  if type(a:position) == v:t_string &&
        \ strlen(a:position) == 1  &&
        \ has_key(l:positions, a:position)

    execute 'wincmd ' . a:position

  else
    call utils#messages#warning('Could not move window to position: ' . a:position)

  endif
endfunction


" Apply the given height to resize the current window.
" This includes a bunch of sanity checks and a warning message.
"
" Arguments:
"   height - number of lines for the window to show
"
function! s:apply_height(height) abort
  if type(a:height) == v:t_number &&
        \ a:height > 0

    execute 'resize ' . a:height

  else
    call utils#messages#warning('Could not resize windows height to: ' . a:height)

  endif
endfunction


" Apply the given width to resize the current window.
" This includes a bunch of sanity checks and a warning message.
"
" Arguments:
"   width - number of columns for the window to show
"
function! s:apply_width(width) abort
  if type(a:width) == v:t_number &&
        \ a:width > 0

    execute 'vertical resize ' . a:width

  else
    call utils#messages#warning('Could not resize windows width to: ' . a:width)

  endif
endfunction
