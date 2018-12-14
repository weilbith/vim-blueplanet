scriptencoding utf-8

" This file contains only global configuration and default sources.

" Global variables
let g:deoplete#enable_at_startup = 1

" Global options.
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


" Sources
" Overall
call deoplete#custom#source('_', 'disabled_syntaxes', ['Comment'])
call deoplete#custom#source('_', 'sorters', ['sorter_rank'])

" Tag
call deoplete#custom#source('tag', 'rank', 600)
call deoplete#custom#source('tag', 'mark', '')

" File
call deoplete#custom#source('file', 'rank', 400)
call deoplete#custom#source('file', 'mark', '')
call deoplete#custom#var('file', 'require_same_filetype', v:true)

" Omni
call deoplete#custom#source('omni', 'rank', 300)
call deoplete#custom#source('omni', 'mark', '')

" Buffer
call deoplete#custom#source('buffer', 'rank', 100)
call deoplete#custom#source('buffer', 'mark', '')
call deoplete#custom#var('buffer', 'require_same_filetype', v:true)

" Dictionary
call deoplete#custom#source('dictionary', 'rank', 50)
call deoplete#custom#source('buffer', 'mark', '﬜')
call deoplete#custom#source('dictionary', 'matchers', ['matcher_head']) " Do no fuzzy search in dictionary.
call deoplete#custom#source('dictionary', 'sorters', []) " Dictionaries should be sorted already.
call deoplete#custom#source('dictionary', 'min_pattern_length', 4) " Do not complete to short words.


" Disable sources
call deoplete#custom#option('ignore_sources', {'_': ['around']}) " Cause it use the deleted words by the change list as well.
