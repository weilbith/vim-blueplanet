" Define some global variables which are used by different sources.
let g:base_folder = $XDG_CONFIG_HOME . '/nvim'
let g:data_folder = $XDG_DATA_HOME . '/nvim'
let g:session_folder = g:data_folder . '/session'
let g:plugin_configuration_folder = g:base_folder . '/plugin-configuration'

" Load extension which are not part of a plugin, autoload etc. and should be
" loaded at the very beginning in a specific order.
execute 'source ' . g:base_folder . '/options.vim'
execute 'source ' . g:base_folder . '/plugin-loading.vim'
