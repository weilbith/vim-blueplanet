" Hook function executed when a plugins is added.
" This checks if the plugin is lazy and only if not, it load its
" configuration.
"
function! plugin#dein#add_hook() abort
  if !g:dein#plugin.lazy
    call plugin#dein#load_config()
  endif
endfunction


" Hook function executed after a plugin was sourced.
" This is only necessary for lazy plugins, which haven't get loaded their
" configuration when they were added.
"
function! plugin#dein#post_source_hook() abort
  if g:dein#plugin.lazy
    call plugin#dein#load_config()
  endif
endfunction


" Simplify the loading of plugin configurations by their name.
" Will be called for an added plugin if it is not lazy,
" or when a lazy plugin gets sourced.
" If no configuration is defined, this does nothing.
"
function! plugin#dein#load_config() abort
  " Get the configuration file for the current plugin.
  let l:config = g:plugin_configuration_folder . '/' . g:dein#plugin.normalized_name . '.vim'
  let l:config = expand(l:config)

  " Check if the configuration file could been found (not all plugins have one)
  if filereadable(l:config)
    execute 'source ' . l:config
  endif
endfunction


" Check for new plugins to install and do so if.
"
function! plugin#dein#install() abort
  if dein#check_install()
    call dein#install()
  endif
endfunction
