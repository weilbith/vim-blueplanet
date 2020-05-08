let g:gutentags_cache_dir = g:data_folder . '/tags'

" Keep in sync with the configured LSP clients.
let g:gutentags_exclude_filetypes = [
      \ 'python',
      \ 'typescript',
      \ 'javascript',
      \ 'sh',
      \ 'zsh',
      \ 'css',
      \ 'scss',
      \ 'sass',
      \ 'less',
      \ 'dockerfile',
      \ 'html',
      \ 'rust',
      \ 'terraform',
      \ 'tex',
      \ 'latex',
      \ 'plaintex',
      \ 'vue',
      \ 'yaml'
      \ ]
