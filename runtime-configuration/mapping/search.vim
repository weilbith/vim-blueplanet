" For some reason the <Plug> call does not wok here so far.

" Open recursive search in project directory and use the quickfix list to
" populate the results.
nnoremap <leader>ss :Ack 
" nnoremap <leader>ss <Plug>(FerretAck)

" Open recursive search in project directory and use the location list to
" populate the results.
nnoremap <leader>sS :Lack 
" nnoremap <leader>sS <Plug>(FerretLack)

" Search recursively in project directory for the word under the cursor.
nnoremap <leader>sw :AckWord <C-r><C-w><CR>
" nnoremap <leader>sw <Plug>(FerretAckWord)

" Execute substitution on the current result.
nnoremap <leader>sr :Acks 
" nnoremap <leader>sr <Plug>(FerretAcks)

" Define arglist as all files which are currently listed in the quickfix list and open command line with
" argdo.
nnoremap <leader>sd :Qargs<CR>:argdo
