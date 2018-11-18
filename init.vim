scriptencoding utf-8

" Define some global variables which are used by different sources.
let g:base_folder = $XDG_CONFIG_HOME . '/nvim'
let g:base_configuration_folder = g:base_folder . '/runtime-configuration'
let g:data_folder = $XDG_DATA_HOME . '/nvim'
let g:session_folder = g:data_folder . '/session'

" Simplify the sourcing by only definining the folder and file name.
" This makes it independent from the base where the sources are placed.
"
" Arguments:
"   name    - plain name of the file as string (without file extension)
"   folder  - plain name of the folder as string (optional)
function! s:source(...) abort
  if (a:0 >= 2)
    execute 'source ' . g:base_configuration_folder . '/' . a:2 . '/' . a:1 . '.vim'
  else
    execute 'source ' . g:base_configuration_folder . '/' . a:1 . '.vim'
  endif
endfunction

" Source basic Vim options.
call s:source('options')

" Plugins
call s:source('plugin-configuration')

" Source all custom mappings.
" Define this after the plugins, cause some of them are based on a specific plugin.
call s:source('mapping')

" Source auto command(groups).
call s:source('formatting', 'autocommands')
call s:source('location', 'autocommands')
call s:source('preview_window', 'autocommands')
call s:source('quickfix', 'autocommands')
call s:source('tags', 'autocommands')

" After options.
call s:source('options-after')
