" Visual selection search with search-word keys.
xnoremap <silent> * :<C-u>call utils#search#visual_selection('/')<CR>
xnoremap <silent> # :<C-u>call utils#search#visual_selection('?')<CR>

" Open recursive search in project directory and use the quickfix list to
" populate the results.
nmap <leader>ss :Ack<Space>

" Open recursive search in project directory and use the location list to
" populate the results.
nmap <leader>sl :Lack<Space>

" Search pattern and open fizzy searching for results.
nmap <silent> <leader>sS :Denite grep<CR>nmap<CR>


" Search recursively in project directory for the word under the cursor.
nmap <leader>sw :Ack -w <C-r><C-w><CR>

" Define arglist as all files which are currently listed in the quickfix list and open command line with
" argdo.
nmap <leader>sd :Qargs<CR>:argdo
