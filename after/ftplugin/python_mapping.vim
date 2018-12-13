nnoremap <buffer> <silent> <leader>to :<C-u>call jedi#goto()<CR>
nnoremap <buffer> <silent> <leader>tl :<C-u>call jedi#usages()<CR>
nnoremap <buffer> <silent> <leader>rr viwy:<C-u>call jedi#rename()<CR><C-r>0
nnoremap <buffer> <silent> K :<C-u>call jedi#show_documentation()<CR>
