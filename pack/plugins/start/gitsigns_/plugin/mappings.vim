nnoremap <leader>gh <cmd>lua require('gitsigns').preview_hunk()<CR>
nnoremap <leader>gH <cmd>lua require('gitsigns').reset_hunk()<CR>
nnoremap <leader>gm <cmd>lua require('gitsigns').blame_line(true)<CR>

nnoremap <silent> <expr> ]h &diff ? ']c' : ":\<C-u>lua require('gitsigns').next_hunk()\<CR>"
nnoremap <silent> <expr> [h &diff ? '[c' : ":\<C-u>lua require('gitsigns').prev_hunk()\<CR>"

onoremap ih <cmd>lua require('gitsigns').text_object()<CR>
onoremap ah <cmd>lua require('gitsigns').text_object()<CR>
xnoremap ih <cmd>lua require('gitsigns').text_object()<CR>
xnoremap ah <cmd>lua require('gitsigns').text_object()<CR>
