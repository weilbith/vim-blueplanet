nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gc :Gcommit<CR>
nnoremap <leader>gp :Gpush<CR>
nnoremap <silent> <leader>gd :<C-u>call utils#git#toggleDiff()<CR>
nnoremap <leader>gP :Gpull<CR>
nnoremap <silent> <leader>gl :<C-u>call utils#git#toggleAgit('Agit')<CR>
nnoremap <silent> <leader>gL :<C-u>call utils#git#toggleAgit('AgitFile')<CR>
nnoremap <silent> <leader>gb :<C-u>call utils#windows#switch_site_window({'open': 'Twiggy', 'close': 'Twiggy'})<CR>
nnoremap <leader>gB :Gblame<CR>
