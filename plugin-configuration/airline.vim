scriptencoding utf-8

" Style
let g:airline_theme='blue_planet'
let g:airline_powerline_fonts=1
let g:airline_skip_empty_sections=1
let g:airline_exclude_preview = 0
let g:airline_inactive_collapse=1

" Tabline
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#show_buffers=1
let g:airline#extensions#tabline#show_tabs=1
let g:airline#extensions#tabline#formatter='unique_tail'
let g:airline#extensions#tabline#buffer_idx_mode=1
let g:airline#extensions#tabline#show_tab_nr=1
let g:airline#extensions#tabline#tab_nr_type=2
let g:airline#extensions#tabline#show_tab_type=1
let g:airline#extensions#tabline#buffers_label='BUFFERS'
let g:airline#extensions#tabline#tabs_label='TABS'
let g:airline#extensions#tabline#current_first=0
let g:airline#extensions#tabline#switch_buffers_and_tabs=1

" Symbols
let g:airline#extensions#tabline#buffer_idx_format = {'0': '⓿ ', '1': '➊ ', '2': '➋ ', '3': '➌ ', '4': '➍ ', '5': '➎ ', '6': '➏ ', '7': '➐ ', '8': '➑ ', '9': '➒ '}
let g:airline_left_sep=''
let g:airline_left_alt_sep=''
let g:airline_right_sep=''
let g:airline_right_alt_sep=''
let g:airline#extensions#tabline#close_symbol=''
let g:airline#extensions#neomake#error_symbol = '✖ '
let g:airline#extensions#neomake#warning_symbol = '⚠ '

" Detection
let g:airline_detect_modified=1
let g:airline_detect_paste=1
let g:airline_detect_crypt=0
let g:airline_detect_spell=1
let g:airline_detect_spelllang=1

" Extensions
let g:airline#extensions#obsession#enabled = 1
let g:airline#extensions#tmuxline#enabled=1
let g:airline#extensions#neomake#enabled=1
let g:airline#extensions#whitespace#enabled = 0

" Accents
call airline#parts#define_accent('mode', 'bold')
call airline#parts#define_accent('linenr', 'none')
call airline#parts#define_accent('maxlinenr', 'none')
call airline#parts#define_accent('WindowNumber', 'bold')

" Sections
" Add the window number in front of the mode.
function! WindowNumber(...)
    let l:builder = a:1
    let l:context = a:2
    call l:builder.add_section('airline_b', ' ❖ %{utils#msc#circle_number(tabpagewinnr(tabpagenr()), v:false)} ')
    return 0
endfunction

" Show a minimal bar for the inactive preview window.
function! PreviewWindow(...)
  let l:builder = a:1
  let l:context = a:2

  let l:regular_preview_window = utils#preview_window#is_preview_window_open() && l:context.winnr == utils#preview_window#get_preview_window_nr()
  let l:quickfix_preview_window = l:context.winnr == utils#quickfix#get_quickfix_preview_window_nr()

  " In case a preview window is open, check if it is this one.
  if l:regular_preview_window || l:quickfix_preview_window
    call l:builder.add_section('airline_a', ' Preview %{g:airline_left_alt_sep}')
    call l:builder.split()
    call l:builder.add_section('airline_z', ' %{g:airline_right_alt_sep} %t')
    return 1 " Don't continue with default sections
  endif
endfunction


" Show a minimal bar for help windows.
function! HelpWindow(...)
  let l:builder = a:1
  let l:context = a:2

  " Only for the helper window (consider that only the context have the correct information).
  if getbufvar(l:context.bufnr, '&filetype') ==? 'help'
    call l:builder.add_section('airline_a', ' Help %{g:airline_left_alt_sep}')
    call l:builder.split()
    call l:builder.add_section('airline_z', ' %{g:airline_right_alt_sep} %t ')
    return 1 " Don't continue with default sections
  endif
endfunction

" Get gutentags status if it is loaded.
function! GutentagStatus () abort
  " Check if gutentags plugin is sourced.
  if dein#is_sourced('gutentags')
    return gutentags#statusline('Generating...')
  else
    return ''
  endif
endfunction


if !exists('s:arline_window_functions_added')
  let s:arline_window_functions_added = v:true
  call airline#add_inactive_statusline_func('PreviewWindow')
  call airline#add_inactive_statusline_func('WindowNumber')
  call airline#add_inactive_statusline_func('HelpWindow')
  call airline#add_statusline_func('HelpWindow')
endif

" Define the functions per section.
let g:airline_section_a=airline#section#create(['mode'])
let g:airline_section_b=airline#section#create(['branch', ' ( ' , 'hunks', ')'])
let g:airline_section_c=airline#section#create(['%t %m %{gutentags#statusline("Generating...")}', 'readonly', 'paste', 'tagbar'])
let g:airline_section_x=airline#section#create(['spell', '  %{g:airline_right_alt_sep} ', 'filetype'])
"let g:airline_section_y=airline#section#create(['fileencoding', 'fileformat'])  " Display plain text, for some reason.
let g:airline_section_z=airline#section#create(['linenr', 'maxlinenr'])

" ---

" Manually refresh the airline, cause else the first line looks like the
" default one.
execute 'AirlineRefresh'
