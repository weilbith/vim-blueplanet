" Find files in current path with live filter in present list (use Denite plugin).
nnoremap <leader>ff :<C-u> call utils#preview_window#call_wrapper('Denite file_rec')<CR>

" Same as before but in the folder of the currently active buffer.
nnoremap <leader>fb :<C-u> call utils#preview_window#call_wrapper('DeniteBufferDir file_rec')<CR>

" Same as before but use the word under the cursor for initial filter.
nnoremap <leader>fw :<C-u> call utils#preview_window#call_wrapper('DeniteCursorWord file_rec')<CR>

" Same as before but in the project folder set by 'denite-options-path'.
nnoremap <leader>fp :<C-u> call utils#preview_window#call_wrapper('DeniteProjectDir file_rec')<CR>
