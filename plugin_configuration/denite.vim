scriptencoding utf-8

call denite#custom#filter('matcher_ignore_globs', 'ignore_globs', [
      \'.git/', 'node_modules/', '!*.fls'
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
      \ ['rg', '--files', '--glob', '!.git', '--glob', '!*.fls', '--glob', '!*.fdb_latexmk'])


" Use a '_' instead of '-' in option names, as documented.
call denite#custom#option('_', {
      \ 'start_filter': v:true,
      \ 'prompt': '➭',
      \ 'winheight': '10',
      \ 'smartcase': v:true,
      \ 'updatetime': 100,
      \ 'vertical_preview': v:true,
      \ 'statusline': 0,
      \ 'highlight_matched_char': 'None'
      \ })

call denite#custom#option('file', {
      \ 'default_action': 'drop'
      \ })
