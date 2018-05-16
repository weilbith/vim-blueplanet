" Here will be sourced all configurations for plugins.

" Simplify the sourcing for plugin configurations by their name.
" Will be called for an added plugin if it is not lazy,
" or when a lazy plugin gets sourced.
" If no configuration is defined, this does nothing.
" 
function! Source() abort
  " Get the configuration file for the current plugin.
  let l:config = g:base_configuration_folder . 'plugin-configuration/' . g:dein#plugin.name . '.vim'
  let l:config = expand(l:config)

  " Check if the configuration file could been found (not all plugins have one)
  if filereadable(l:config)
    execute 'source ' . l:config
  endif
endfunction


" Some importent folders
let s:dein_base_folder = '~/.cache/dein'
let s:plugin_configuration_folder = g:base_configuration_folder . 'plugin-configuration/'

" Load dein's configuration.
execute 'source ' . s:plugin_configuration_folder . 'dein.vim'

" Define list of all configuration files of interest for the caching.
let s:vimrcs = split(expand(s:plugin_configuration_folder . '*.vim')) " All configurations for each plugin.
let s:vimrcs = add(s:vimrcs, expand('<sfile>')) " This file itself.


" Add dein.vim as plugin manager.
execute 'set runtimepath+=' . s:dein_base_folder . '/repos/github.com/Shougo/dein.vim'

" Add all plugins and their configurations.
if dein#load_state(s:dein_base_folder)
  call dein#begin(s:dein_base_folder, s:vimrcs)

  call dein#add('Shougo/dein.vim')

  call dein#add('easymotion/vim-easymotion')

  call dein#add('vim-airline/vim-airline', {
        \ 'name': 'airline',
        \ 'merged': 0
        \ })
  
  call dein#add('t9md/vim-choosewin', {
        \ 'name': 'choosewin'
        \ })
   
   call dein#add('weilbith/vim-cursorword', {
         \ 'name': 'cursor-word'
         \ })
   
   call dein#add('Raimondi/delimitMate', {
         \ 'name': 'delimit-mate',
         \ 'lazy': 1,
         \ 'on_event': 'InsertEnter'
         \ })

   call dein#add('Shougo/denite.nvim', {
         \ 'name': 'denite'
         \ })
   
   call dein#add('ryanoasis/vim-devicons', {
         \ 'name': 'dev-icons'
         \ })
   
   call dein#add('wincent/ferret', {
         \ 'name': 'ferret',
         \ 'on_event': 'CursorHold'
         \ })
   
   call dein#add('ludovicchabant/vim-gutentags', {
         \ 'name': 'gutentags'
         \ })
   
   call dein#add('Yggdroot/indentLine', {
         \ 'name': 'indent-line'
         \ })
   
   call dein#add('junegunn/goyo.vim')
   
   call dein#add('junegunn/limelight.vim', {
         \ 'name': 'lime-light',
         \ 'on_event': 'GoyoEnter'
         \ })
   
   call dein#add('andymass/vim-matchup', {
         \ 'name': 'match-up'
         \ })
   
  call dein#add('Shougo/neosnippet.vim', {
        \ 'hook_add': 'source ' . g:base_configuration_folder . 'plugin-configuration/neosnippet.vim'
        \ })
   
  call dein#add('scrooloose/nerdcommenter', {
        \ 'name': 'nerd-commenter'
        \ })

  call dein#add('scrooloose/nerdtree', {
        \ 'name': 'nerd-tree',
        \ 'lazy': 1,
        \ 'on_cmd:': ['NERDTree', 'NERDTreeToggle', 'NERDTreeFromBookmark', 'NERDTreeFocus']
        \ })
  
  call dein#add('Xuyuanp/nerdtree-git-plugin', {
        \ 'name': 'nerd-tree_git',
        \ 'depends': 'nerd-tree'
        \ })
  
  call dein#add('tiagofumo/vim-nerdtree-syntax-highlight', {
        \ 'name': 'nerd-tree_syntax-highlight',
        \ 'depends': 'nerd-tree'
        \ })
  
  call dein#add('airblade/vim-rooter', {
        \ 'name': 'rooter'
        \ })
  
  call dein#add('mhinz/vim-signify', {
        \ 'name': 'signify'
        \ })

  call dein#add('kien/tabman.vim', {
        \ 'name': 'tabman',
        \ 'on_cmd': ['TMToggle', 'TMFocus']
        \ })

  call dein#add('majutsushi/tagbar', {
        \ 'name': 'tagbar',
        \ 'on_cmd': ['TagbarOpen', 'TagbarToggle']
        \ })

  " Do not use 'on_cmd' cause some hook error gets thrown by the plugin.
  call dein#add('mbbill/undotree', {
        \ 'name': 'undo-tree',
        \ 'on_cmd': 'UndoTreeToggle'
        \ })

  call dein#add('vim-scripts/YankRing.vim', {
        \ 'name': 'yank-ring'
        \ })

  call dein#add('Valloric/MatchTagAlways', {
        \ 'name': 'match-tag-always'
        \ })

  call dein#add('neomake/neomake', {
        \ 'name': 'neomake'
        \ })

  call dein#add('tpope/vim-surround')
  call dein#add('gko/vim-coloresque')
  call dein#add('alvan/vim-closetag')
  call dein#add('tpope/vim-repeat')
  call dein#add('kshenoy/vim-signature')
  call dein#add('wellle/targets.vim')
  call dein#add('tommcdo/vim-exchange')
  call dein#add('tommcdo/vim-lion')
  call dein#add('AndrewRadev/splitjoin.vim')


  " source $HOME/.vim/runtime-configuration/plugin-configuration/deoplete.vim
  " source $HOME/.vim/runtime-configuration/plugin-configuration/neomake.vim
  " source $HOME/.vim/runtime-configuration/plugin-configuration/vim-session.vim
  " source $HOME/.vim/runtime-configuration/plugin-configuration/markdown.vim
  
  
  " Further plugins without their own configuration:
  "    - fugitive (mapping in git section)
  "    - misc (required for vim-session)
  "    - tabular (especially used in vim-markdown)

  call dein#set_hook([], 'hook_post_source', function('Source'))
  call dein#end()
  call dein#save_state()
endif

" Check for updates and install them automatically.
if has('vim_starting') && dein#check_install()
  call dein#install()
endif

" Must be set again, cause dein unset it.
filetype plugin on
