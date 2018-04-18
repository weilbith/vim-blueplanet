" Flag for event composition, if a new buffer has been added into the preview window.
let s:new_preview = 0


augroup PreviewWindow
  autocmd!

  " -> a buffer is shown in the preview window, that does not exits so far
  " in this case the the buffer is not already loaded and setting local variables does not work.
  " set a global flag that mark this event to handle it later on when the buffer is loaded.
  autocmd bufadd * nested if &previewwindow |
        \ let s:new_preview = v:true |
        \ endif

  " -> event that should follow after a (new) buffer has entered to the preview window
  " check if the global flag has been set, that this is a new preview buffer.
  " the buffer is now available and local settings and variables can be defined.
  " make sure the buffer gets cleared after it loose its window.
  " set a buffer variable to mark it for further events.
  autocmd bufwinenter * nested if &previewwindow && s:new_preview |
        \ let s:new_preview = v:false |
        \ setlocal nobuflisted |
        \ setlocal bufhidden=wipe |
        \ let b:previewonly = v:true |
        \ endif

  " -> the buffer in the preview window will be opened anywhere else
  " in case a buffer is entered, that has the buffer variable to be a 'previewony ' buffer,
  " it will be remove from there, added to the buffer list again and will not
  " be deleted when not displayed anymore.
  autocmd bufenter * nested 
       \ try |
       \   if b:previewonly |
       \     unlet b:previewonly |
       \     setlocal buflisted |
       \     setlocal bufhidden= |
       \   endif |
       \ catch |
       \ endtry

augroup END
