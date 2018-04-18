" Define some global variables which are used by different sources.
let g:blueplanet_session_dir='.vim/session' " For vim-session and startify

" Source basic vim options.
source $HOME/.vim/runtime-configuration/options.vim

" Source some helper/utility functions used at different places.
source $HOME/.vim/runtime-configuration/helper/utilities.vim
source $HOME/.vim/runtime-configuration/helper/preview_window.vim
source $HOME/.vim/runtime-configuration/helper/quickfix.vim
source $HOME/.vim/runtime-configuration/helper/location.vim
source $HOME/.vim/runtime-configuration/helper/tags.vim

" Plugins
" Build the runtime path with Pathogen
execute pathogen#infect()

" Source the configurations
source $HOME/.vim/runtime-configuration/plugin-configuration.vim

" Source all custom mappings.
" Define this after the plugins, cause some of them are based on a specific plugin.
source $HOME/.vim/runtime-configuration/mapping.vim

" Source auto command(groups).
source $HOME/.vim/runtime-configuration/autocommands/preview_window.vim
source $HOME/.vim/runtime-configuration/autocommands/quickfix.vim
source $HOME/.vim/runtime-configuration/autocommands/location.vim
source $HOME/.vim/runtime-configuration/autocommands/tags.vim
