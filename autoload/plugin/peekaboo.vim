scriptencoding 'utf-8'

function! plugin#peekaboo#open_centered_floating_window() abort
  let l:dimensions = s:get_floating_window_dimensions(0.6)
  let l:options = s:get_floating_window_options(l:dimensions)
  call s:open_floating_window(l:options)
endfunction

function! s:get_floating_window_dimensions(size_factor) abort
  let l:width = float2nr(&columns * a:size_factor)
  let l:height = float2nr(&lines * a:size_factor)
  let l:top = ((&lines - l:height) / 2) - 1
  let l:left = (&columns - l:width) / 2
  return {'width': l:width, 'height': l:height, 'top':  l:top, 'left': l:left}
endfunction

function! s:get_floating_window_options(dimensions) abort
  return {
        \ 'relative': 'editor',
        \ 'row': a:dimensions.top,
        \ 'col': a:dimensions.left,
        \ 'width': a:dimensions.width,
        \ 'height': a:dimensions.height,
        \ 'style': 'minimal'
        \ }
endfunction

function! s:open_floating_window(options) abort
  let l:buffer_number = nvim_create_buf(v:false, v:true)
  call nvim_open_win(l:buffer_number, v:true, a:options)
endfunction
