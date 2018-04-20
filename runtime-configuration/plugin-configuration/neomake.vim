let g:neomake_open_list = 2 " Don't jump to the quickfix/location window automatically.
let g:neomake_highlight_columns = 1
" let g:neomake_verbose=3

" Enabled markers
let g:neomake_java_enabled_markers = ['ant']

" Style
" let g:neomake_error_sign = '✖'
" let g:neomake_warning_sign = '➤'
" let g:neomake_info_sign = 'i'


" Functions

" Determine if the current device is running on battery.
" Hardy depends on the device and OS!!!
"
function! s:is_on_battery()
  return v:false
  " return readfile('/sys/class/power_supply/AC/online') == ['0']
endfunction

" Configure automake depending on the device.
if s:is_on_battery() | call neomake#configure#automake('w')
else | call neomake#configure#automake('nw', 1000) | endif
