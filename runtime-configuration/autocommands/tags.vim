augroup AutoTags
   autocmd!
   
   " Open current word in preview window, if this is already open.
   " The delay for the event depends on 'updatetime'.
   autocmd CursorHold * nested call tags#preview_word()
augroup END
