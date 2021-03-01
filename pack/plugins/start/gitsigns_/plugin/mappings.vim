nnoremap <leader>gh <cmd>lua require('gitsigns').preview_hunk()<CR>
nnoremap <leader>gH <cmd>lua require('gitsigns').reset_hunk()<CR>

nnoremap ]gh <cmd>lua require('gitsigns').next_hunk()<CR>
nnoremap [gh <cmd>lua require('gitsigns').prev_hunk()<CR>

onoremap igh <cmd>lua require('gitsigns').text_object()<CR>
onoremap agh <cmd>lua require('gitsigns').text_object()<CR>
xnoremap igh <cmd>lua require('gitsigns').text_object()<CR>
xnoremap agh <cmd>lua require('gitsigns').text_object()<CR>
