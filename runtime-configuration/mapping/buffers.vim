" Move between buffers in order as the buffer list.
nnoremap <leader>bn :bnext<CR>
nnoremap <leader>bp :bprevious<CR>

" Delete buffer and safe it before (without close the window displayed in).
nnoremap <silent> <leader>bd :<C-u> call <SID>delete_buffer(v:true, v:false)<CR>

" Delete buffer without save.
nnoremap <silent> <leader>bD :<C-u> call <SID>delete_buffer(v:false, v:true)<CR>

" Search in all buffers with live filter in present list (use Denite plugin).
nnoremap <leader>bb :Denite buffer<CR>

" Switch buffer in active window to buffer with specific id (use the Airline plugin).
" Do no use the [N}b(uffer) command, cause it does not relate with the visual tab bar ids.
nmap <leader>b1 <Plug>AirlineSelectTab1
nmap <leader>b2 <Plug>AirlineSelectTab2
nmap <leader>b3 <Plug>AirlineSelectTab3
nmap <leader>b4 <Plug>AirlineSelectTab4
nmap <leader>b5 <Plug>AirlineSelectTab5
nmap <leader>b6 <Plug>AirlineSelectTab6
nmap <leader>b7 <Plug>AirlineSelectTab7
nmap <leader>b8 <Plug>AirlineSelectTab8
nmap <leader>b9 <Plug>AirlineSelectTab9



" Functions

" Delete the currently active buffer without closing the window it is displayed in.
" In result the previous buffer will be shown in the window.
"
" Arguments:
"   save  - if the buffer should be written as first (can lead to an error if not and do not force quit)
"   force - if the buffer should be force quit (destroy not saved changes)
"
function! s:delete_buffer(save, force) abort
  " Store the current window height to reset it after the split changed it eventually.
  " Only the height is relevant, cause a horizontal split is used.
  let l:height = winheight('%')

  " Save the current buffer if requested.
  if a:save
    write
  endif
 
  " Open the previous window in a new split and switch back to the to delete buffer.
  bprevious
  split
  bnext
 
  " Delete the buffer, either force it or not.
  if a:force
    bdelete!
  else
    bdelete
  endif
  
  " Resize the new window that was split with the previous buffer.
  execute "resize " . l:height
endfunction
