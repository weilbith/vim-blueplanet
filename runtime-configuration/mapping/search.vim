" Open recursive search in project directory and use the quickfix list to
" populate the results.
nmap <leader>ss <Plug>(FerretAck) 

" Open recursive search in project directory and use the location list to
" populate the results.
nmap <leader>sS <Plug>(FerretLack)

" Search recursively in project directory for the word under the cursor.
nmap <leader>sw <Plug>(FerretAckWord)

" Execute substitution on the current result.
nmap <leader>sr <Plug>(FerretAcks)

" Define arglist as all files which are currently listed in the quickfix list and open command line with
" argdo.
nmap <leader>sd :Qargs<CR>:argdo
