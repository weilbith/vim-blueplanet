" Open tag under cursor.
nnoremap <leader>to :tag <C-R><C-W><CR>

" Go back in the tag jump history
nnoremap <leader>tb :pop!<CR>
nnoremap <leader>ta :tag!<CR>
nnoremap <leader>th :tags<CR>

" Open and jump to the tagbar window (use the TagBar plugin)
nnoremap <leader>tt :TagbarOpen fj<CR>

" Sow tag under cursor in preview window.
nnoremap <leader>tp :ptjump <C-R><C-W><CR>

" Show match list for tag under cursor.
nnoremap <leader>tl :tselect <C-R><C-W><CR>

" Open next/previous match.
nnoremap <leader>t* :tnext<CR>
nnoremap <leader>t# :tprevious<CR>

" Show next/previous match in the preview window.
nnoremap <leader>tn :ptnext<CR>
nnoremap <leader>tN :ptprevious<CR>

" Open the match shown in the current preview window.
nnoremap <silent> <leader>tO :<C-u> call tags#open_preview_match()<CR>

" Search in tag list and use live filter (use the Denite plugin)
nnoremap <leader>ts :Denite outline<CR>
