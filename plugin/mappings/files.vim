" Find files in current path with live filter in present list (use Denite plugin).
nnoremap <silent> <leader>ff :<C-u> call utils#preview_window#call_wrapper('Denite file/rec')<CR>

" Same as before but in the folder of the currently active buffer.
nnoremap <silent> <leader>fb :<C-u> call utils#preview_window#call_wrapper('DeniteBufferDir file/rec')<CR>

" Same as before but use the word under the cursor for initial filter.
nnoremap <silent> <leader>fw :<C-u> call utils#preview_window#call_wrapper('DeniteCursorWord file/rec')<CR>

" Same as before but in the project folder set by 'denite-options-path'.
nnoremap <silent> <leader>fp :<C-u> call utils#preview_window#call_wrapper('DeniteProjectDir file/rec')<CR>
