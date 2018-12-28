" Move between buffers in submode requires submode plugin)
call submode#enter_with('test', 'n', 's', '<space>bn', ':bnext<Cr>')
call submode#enter_with('test', 'n', 's', '<space>bp', ':bprevious<Cr>')
call submode#map('test', 'n', 's', 'n', ':bnext<Cr>')
call submode#map('test', 'n', 's', 'p', ':bprevious<Cr>')

" Delete buffer and safe it before (without close the window displayed in).
nnoremap <silent> <leader>bd :<C-u>call utils#buffers#delete_buffer(v:true, v:false)<CR>

" Delete buffer without save.
nnoremap <silent> <leader>bD :<C-u>call utils#buffers#delete_buffer(v:false, v:true)<CR>

" Search in all buffers with live filter in present list (use Denite plugin).
nnoremap <leader>bb :Denite buffer<CR>

" Switch buffer in active window to buffer with specific id (use the lightline-buffers plugin).
" Do no use the [N}b(uffer) command, cause it does not relate with the visual tab bar ids.
nmap <leader>b1 <Plug>lightline#bufferline#go(1)
nmap <leader>b2 <Plug>lightline#bufferline#go(2)
nmap <leader>b3 <Plug>lightline#bufferline#go(3)
nmap <leader>b4 <Plug>lightline#bufferline#go(4)
nmap <leader>b5 <Plug>lightline#bufferline#go(5)
nmap <leader>b6 <Plug>lightline#bufferline#go(6)
nmap <leader>b7 <Plug>lightline#bufferline#go(7)
nmap <leader>b8 <Plug>lightline#bufferline#go(8)
nmap <leader>b9 <Plug>lightline#bufferline#go(9)
