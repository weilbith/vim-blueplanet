call denite#custom#filter('matcher_ignore_globs', 'ignore_globs', ['.git/',
      \ '.git\'])


" Use a '_' instead of '-' in option names, as documented.
" Preview window cause problems here.
call denite#custom#option('_', {
      \ 'prompt': '➭',
      \ 'mode': 'insert',
      \ 'highlight_matched_char': 'None',
      \ 'highlight_matched_range': 'None',
      \ 'vertical_preview': v:true,
      \ 'auto_preview': v:false,
      \ 'auto_resize': v:true,
      \ 'winminheight': '10',
      \ 'smartcase': v:true,
      \ 'quit': v:true
      \ })

" Change mappings for the denite window.
call denite#custom#map('insert', '<Esc>', '<denite:enter_mode:normal>', 'noremap') " Normal Vim behavior of change the mode.
call denite#custom#map('normal', '<Esc>', '<denite:quit>') " Suspend on escape, when are in normal mode. (so double escape close the window) 
call denite#custom#map('insert', '<C-j>', '<denite:move_to_next_line><denite:suspend>', 'noremap') " Quit on escape, when are in normal mode. (so double escape close the window) 
call denite#custom#map('insert', '<C-k>', '<denite:move_to_previous_line>', 'noremap') " Suspend on escape, when are in normal mode. (so double escape close the window) 


" Has further mappings in the sections buffers, files and tags.
