nnoremap <silent> <leader>gs :Gstatus<CR>
nnoremap <silent> <leader>gc :Gcommit<CR>
nnoremap <silent> <leader>gp :Gpush<CR>
nnoremap <silent> <silent> <leader>gd :<C-u>call utils#git#toggleDiff()<CR>
nnoremap <silent> <leader>gP :Gpull<CR>
nnoremap <silent> <silent> <leader>gl :<C-u>call utils#git#toggleAgit('Agit')<CR>
nnoremap <silent> <silent> <leader>gL :<C-u>call utils#git#toggleAgit('AgitFile')<CR>
nnoremap <silent> <silent> <leader>gb :<C-u>call utils#windows#switch_site_window({'open': 'Twiggy', 'close': 'Twiggy'})<CR>
nnoremap <silent> <leader>gB :Gblame<CR>
