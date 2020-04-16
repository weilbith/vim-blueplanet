function! utils#tags#open() abort
  if utils#lsp#is_client_available_for_current_buffer()
    lua vim.lsp.buf.definition()
  else
    execute 'tag ' . expand('<cword>')
  endif
endfunction

function! utils#tags#preview() abort
  if utils#lsp#is_client_available_for_current_buffer()
    lua vim.lsp.buf.peek_definition()
  else
    execute 'ptjump ' . expand('<cword>')
  endif
endfunction

function! utils#tags#references() abort
  if utils#lsp#is_client_available_for_current_buffer()
    lua vim.lsp.buf.references()
    echom 'ja lol ey'
  else
    execute 'tselect ' . expand('<cword>')
  endif
endfunction

function! utils#tags#hover() abort
  if utils#lsp#is_client_available_for_current_buffer()
    lua vim.lsp.buf.hover()
  else
    execute &keywordprg . ' ' . expand('<cword>')
  endif
endfunction

function! utils#tags#signature() abort
  if utils#lsp#is_client_available_for_current_buffer()
    lua vim.lsp.buf.signature_help()
  endif
endfunction


" Function to open the word under the cursor in the preview window.
" Furthermore it open a possible fold in the preview buffer.
" At least it highlight the tag in the preview buffer.
" Only works if the preview window is already open.
"
function! utils#tags#preview_word() abort
  " Only do this if the preview window is open.
  if utils#preview_window#is_preview_window_open()
    " Don't do this in the preview window itself or any special buffer
    " (typically not listed).
    if &previewwindow || !&buflisted | return | endif

    " Get current word under the cursor.
    let l:word = expand('<cword>')

    " Only process further, when the word contains a letter.
    if l:word =~? '\a'
      " Use the word till the dot, cause thats the object of interest.
      let l:word = split(l:word)[0]

      " Jump to preview window (if possible), clear old highlights and jump back.
      silent! wincmd P
      if &previewwindow
        match none
        wincmd p
      endif

      " Try displaying a matching tag for the word under the cursor
      try
        exe 'ptag ' . l:word
      catch
        return
      endtry

      " Jump to preview window (if possible) and do some nice things.
      silent! wincmd P
      if &previewwindow
        " Open possible folds
        if has('folding')
          silent! .foldopen
        endif

        " Search for this word
        call search('$', 'b')
        let l:word = substitute(l:word, '\\', '\\\\', '')
        call search('\<\V' . l:word . '\>') " position cursor on match

        " Add a match highlight to the word at this position
        exe 'match previewWord "\%' . line('.') . 'l\%' . col('.') . 'c\k*"'

        " Jump back to original window.
        wincmd p
      endif
    endif
  endif
endfunction
