scriptencoding utf-8

call denite#custom#filter('matcher_ignore_globs', 'ignore_globs', [
      \'.git/', 'node_modules/'
      \ ])

" Use Ripgrep accordingly to the documentations settings.
call denite#custom#var('grep', 'command', ['rg'])
call denite#custom#var('grep', 'recursive_opts', [])
call denite#custom#var('grep', 'pattern_opt', ['--regexp'])
call denite#custom#var('grep', 'separator', ['--'])
call denite#custom#var('grep', 'final_opts', [])
call denite#custom#var('grep', 'default_opts',
    \ ['--vimgrep', '--no-heading'])

call denite#custom#var('file/rec', 'command',
      \ ['rg', '--files', '--glob', '!.git'])


" Use a '_' instead of '-' in option names, as documented.
call denite#custom#option('_', {
      \ 'prompt': '➭',
      \ 'mode': 'insert',
      \ 'highlight_matched_char': 'None',
      \ 'vertical_preview': v:true,
      \ 'auto_preview': v:false,
      \ 'auto_resize': v:true,
      \ 'winminheight': '10',
      \ 'smartcase': v:true,
      \ 'updatetime': 10,
      \ 'unique': v:true,
      \ 'quit': v:true
      \ })

call denite#custom#option('file', {
      \ 'default_action': 'drop'
      \ })

" Change mappings for the denite window.
call denite#custom#map('insert', '<Esc>', '<denite:enter_mode:normal>', 'noremap') " Normal Vim behavior of change the mode.
call denite#custom#map('normal', '<Esc>', '<denite:quit>') " Suspend on escape, when are in normal mode. (so double escape close the window)
call denite#custom#map('insert', '<C-j>', '<denite:move_to_next_line><denite:suspend>', 'noremap')
call denite#custom#map('insert', '<C-k>', '<denite:move_to_previous_line>', 'noremap')
call denite#custom#map('normal', 'p', '<denite:do_action:preview>', 'noremap')


" Has further mappings in the sections buffers, files and tags.
