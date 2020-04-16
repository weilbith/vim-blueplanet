function! utils#refactor#rename() abort
  if utils#lsp#is_client_available_for_current_buffer()
    lua vim.lsp.buf.rename()
  else
    call utils#refactor#rename_via_substitute(expand('<cword>'))
  endif
endfunction


" Do a substitution for a given pattern.
" Interact with the user to get the replacement.
"
" Arguments:
"   word - the pattern to replace
"
function! utils#refactor#rename_via_substitute(word) abort
  if len(a:word) > 0
    " Get a replacement by the user.
    let l:replace = input({
          \ 'prompt': 'Replacement: ',
          \ 'default': a:word
          \ })

    " Interrupt if input is empty.
    if len(l:replace) <= 0 | return | endif

    " Do the substitution in the active buffer.
    execute '%s/' . a:word . '/' . l:replace . '/g'

  else
    call utils#messages#warning('No word under the cursor to refactor!')

  endif
endfunction
