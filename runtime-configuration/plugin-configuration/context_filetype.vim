" Create the same_filetype dictionary if not aready exists.
if !exists('g:context_filetype#same_filetypes')
  let g:context_filetype#same_filetypes = {}
endif

" Define some filetypes, which are equal to others.
let g:context_filetype#same_filetypes.vue = 'javascript,json'
let g:context_filetype#same_filetypes.gitcommit = '_'

" The rest is quite awesome as defined per default
" (autoload/context_filetype.vim)
