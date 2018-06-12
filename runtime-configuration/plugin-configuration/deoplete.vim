let g:deoplete#enable_at_startup = 1

call deoplete#custom#option({
      \ 'auto_complete': v:true,
      \ 'auto_complete_delay': 200,
      \ 'auto_refresh_delay': 50,
      \ 'max_list': 50,
      \ 'num_processes': 2,
      \ 'smart_case': v:true,
      \ 'min_pattern_length': 2,
      \ 'delimiters': ['/', '\.']
      \ })

" General source definitions.
call deoplete#custom#source('_', 'disabled_syntaxes', ['Comment'])
call deoplete#custom#source('_', 'disabled_syntaxes', ['Comment'])
call deoplete#custom#source('_', 'sorters', ['sorter_rank'])

" Source ranking.
call deoplete#custom#source('tag', 'rank', 600)
call deoplete#custom#source('neosnippet', 'rank', 500)
call deoplete#custom#source('file', 'rank', 400)
call deoplete#custom#source('omni', 'rank', 300)
call deoplete#custom#source('buffer', 'rank', 100)

" Omni patterns for filetypes.
" Use HTML Omnicompletion.
" call deoplete#custom#source('vue', 'omni_patterns', ['<', '</', '<[^>*\s[[:alnum:]-]*'])


" Disable sources.
call deoplete#custom#option('ignore_sources', {'_': ['around']}) " Cause it use the deleted words by the change list as well.

" Define source variables.
call deoplete#custom#var('buffer', 'require_same_filetype', v:true)
call deoplete#custom#var('file', 'require_same_filetype', v:true)

" Enable sources for specific filetypes.
call deoplete#custom#source('emoji', 'filetypes', ['gitcommit', 'markdown', 'mail', 'text'])
