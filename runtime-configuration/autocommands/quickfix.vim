" The maximum height for the quickfix window.
let s:quickfix_height = 10

" Flag for event composition, if a new buffer has been added into the preview window.
let s:new_qf_preview = 0


augroup Quickfix
  autocmd!
  
  " Put the quickfix window on the most bottom.
  " If number of entries in the quickfix list is higher than a threshold,
  " set the window height to this threshold.
  " Else (less than) shrink it to the number of entries plus one empty line,
  " to show that this are all entries.
  autocmd! BufReadPost quickfix if !utils#location#is_location_window(win_getid()) |
        \ wincmd J |
        \ let s:quickfix_length = len(getqflist()) |
        \ if s:quickfix_length > s:quickfix_height |
        \   exe "resize " . s:quickfix_height |
        \ else |
        \   exe "resize " . (s:quickfix_length + 1) |
        \ endif

  " Show the quickfix entry under the cursor as preview when cursor stay there.
  autocmd CursorHold * nested if &filetype == 'qf' && !utils#location#is_location_window(win_getid()) |
        \ call utils#quickfix#show_quickfix_preview() |
        \ endif

  " Unset the preview window number if the window gets closed.
  autocmd QuitPre * nested if utils#quickfix#is_quickfix_preview_window() |
        \ let s:quickfix_preview_window_nr = ""
        \ endif

  " -> a buffer is shown in the preview window, that does not exits so far
  " in this case the the buffer is not already loaded and setting local variables does not work.
  " set a global flag that mark this event to handle it later on when the buffer is loaded.
  autocmd bufadd * nested if utils#quickfix#is_quickfix_preview_window() |
        \ let s:new_qf_preview = v:true |
        \ endif

  " -> event that should follow after a (new) buffer has entered to the preview window
  " check if the global flag has been set, that this is a new preview buffer.
  " the buffer is now available and local settings and variables can be defined.
  " make sure the buffer gets cleared after it loose its window.
  " set a buffer variable to mark it for further events.
  autocmd bufwinenter * nested if utils#quickfix#is_quickfix_preview_window() && s:new_qf_preview |
        \ let s:new_qf_preview = v:false |
        \ setlocal nobuflisted |
        \ setlocal bufhidden=wipe |
        \ let b:qfpreviewonly = v:true |
        \ endif
  
  " -> the buffer in the preview window will be opened anywhere else
  " in case a buffer is entered, that has the buffer variable to be a 'previewony ' buffer,
  " it will be remove from there, added to the buffer list again and will not
  " be deleted when not displayed anymore.
  autocmd bufenter * nested 
       \ try |
       \   if b:qfpreviewonly |
       \     unlet b:qfpreviewonly |
       \     setlocal buflisted |
       \     setlocal bufhidden= |
       \   endif |
       \ catch |
       \ endtry
augroup END
