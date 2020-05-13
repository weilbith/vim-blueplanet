scriptencoding utf-8

call denite#custom#filter('matcher_ignore_globs', 'ignore_globs', [
      \'.git/', 'node_modules/', '!*.fls', 'dictionaries/'
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
      \ 'prompt': '➭',
      \ 'winheight': '10',
      \ 'smartcase': v:true,
      \ 'updatetime': 100,
      \ 'vertical_preview': v:true,
      \ 'floating_preview': v:true,
      \ 'statusline': 0,
      \ 'highlight_matched_char': 'None',
      \ 'split': 'floating',
      \ 'preview_width': 70,
      \ 'refresh': v:true,
      \ 'empty': v:false,
      \ })

call denite#custom#option('file', {
      \ 'default_action': 'drop'
      \ })
