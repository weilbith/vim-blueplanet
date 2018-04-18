" Rename the word under the cursor.
nnoremap <leader>rr :<C-u> call <SID>rename(expand('<cword>'))<CR>

" Rename the current selection.
vnoremap <leader>rr :<C-u> call <SID>rename(utilities#get_visual_selection())<CR>


" Functions

" Do a substitution for a given pattern.
" Interact with the user to get the replacement.
"
" Arguments:
"   word - the pattern to replace
"
function! s:rename(word)
  if len(a:word) > 0
    " Get a replacement by the user.
    let l:replace = input("Replacement (" . a:word . "): ")
    
    " Interrupt if input is empty.
    if len(l:replace) <= 0 | return | endif

    " Do the substitution in the active buffer.
    execute '%s/' . a:word . '/' . l:replace . '/g'
     
  else
    call utilities#show_warning_message("No word under the cursor to refactor!")

  endif
endfunction!
