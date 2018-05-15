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
    let l:word = expand("<cword>")

    " Only process further, when the word contains a letter.
    if l:word =~ '\a'
      " Jump to preview window (if possible), clear old highlights and jump back.
      silent! wincmd P
      if &previewwindow
        match none
        wincmd p
      endif
      
      " Try displaying a matching tag for the word under the cursor
      try
        exe "ptag " . l:word
      catch
        return
      endtry
      
      " Jump to preview window (if possible) and do some nice things.
      silent! wincmd P
      if &previewwindow
        " Open possible folds
        if has("folding")
          silent! .foldopen
        endif

        " Search for this word
        call search("$", "b")
        let l:word = substitute(l:word, '\\', '\\\\', "")
        call search('\<\V' . l:word . '\>')	" position cursor on match

        " Add a match highlight to the word at this position
        exe 'match previewWord "\%' . line(".") . 'l\%' . col(".") . 'c\k*"'

        " Jump back to original window.
        wincmd p
      endif
    endif
  endif
endfunction


" Open the buffer that is currently shown in the preview window
" and jump to the same position (where the tag is located).
" Does nothing, if no preview window is open.
"
function! utils#tags#open_preview_match() abort
  " Only works if the preview window is open.
  if utils#preview_window#is_preview_window_open()
    " Jump (and back) to the preview window to get the open buffer and the cursor position.
    wincmd P
    let l:bufnr = bufnr('%')
    let l:linenr = line('.')
    wincmd p

    " Open the buffer in the current window and jump to the specific line.
    execute 'buffer ' . l:bufnr
    execute l:linenr

    " Center the current line.
    normal zz

  " Show message that feature is not available.
  else
    echom "No preview window open!"

  endif
endfunction
