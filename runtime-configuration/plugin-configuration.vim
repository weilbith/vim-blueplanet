" Some importent folders
let s:dein_base_folder = '~/.cache/dein'
let s:plugin_configuration_folder = g:base_configuration_folder . 'plugin-configuration/'


" Hook function executed when a plugins is added.
" This checks if the plugin is lazy and only if not, it load its
" configuration.
"
function! AddHook() abort
  if !g:dein#plugin.lazy
    call LoadConfig()
  endif
endfunction

" Hook function executed after a plugin was sourced.
" This is only necessary for lazy plugins, which haven't get loaded their
" configuration when they were added.
"
function! PostSourceHook() abort
  if g:dein#plugin.lazy
    call LoadConfig()
  endif
endfunction

" Simplify the loading of plugin configurations by their name.
" Will be called for an added plugin if it is not lazy,
" or when a lazy plugin gets sourced.
" If no configuration is defined, this does nothing.
"
function! LoadConfig() abort
  " Get the configuration file for the current plugin.
  let l:config = s:plugin_configuration_folder . g:dein#plugin.normalized_name . '.vim'
  let l:config = expand(l:config)

  " Check if the configuration file could been found (not all plugins have one)
  if filereadable(l:config)
    execute 'source ' . l:config
  endif
endfunction


" Load dein's configuration itself.
execute 'source ' . s:plugin_configuration_folder . 'dein.vim'

" Define list of all configuration files of interest for the caching.
let s:vimrcs = split(expand(s:plugin_configuration_folder . '*.vim')) " All configurations for each plugin.
let s:vimrcs = add(s:vimrcs, expand('<sfile>')) " This file itself.


" AddHook dein.vim as plugin manager.
execute 'set runtimepath+=' . s:dein_base_folder . '/repos/github.com/Shougo/dein.vim'

" AddHook all plugins and their configurations.
"if dein#load_state(s:dein_base_folder)
call dein#begin(s:dein_base_folder, s:vimrcs)

call dein#add('Shougo/dein.vim')
call dein#add('ryanoasis/vim-devicons')
call dein#add('ludovicchabant/vim-gutentags')
call dein#add('andymass/vim-matchup')
call dein#add('scrooloose/nerdcommenter')
call dein#add('neomake/neomake')
call dein#add('tpope/vim-fugitive')
call dein#add('junegunn/goyo.vim')
call dein#add('kana/vim-submode')
call dein#add('sbdchd/neoformat')
call dein#add('tommcdo/vim-lion')
call dein#add('mhinz/vim-signify')
call dein#add('weilbith/vim-cursorword')
call dein#add('airblade/vim-rooter')
call dein#add('easymotion/vim-easymotion')
call dein#add('tpope/vim-surround')
call dein#add('gko/vim-coloresque')
call dein#add('tpope/vim-repeat')
call dein#add('kshenoy/vim-signature')
call dein#add('wellle/targets.vim')
call dein#add('tommcdo/vim-exchange')
call dein#add('Shougo/neosnippet.vim')

call dein#add('vim-scripts/YankRing.vim', {
      \ 'name': 'yankring'
      \ })

" Some statusline segments depends on other plugins like fugitive.
" There this plugins need to be sourced before airline.
" For some reason the 'on_source' does not work here...
" Therefore use the VimEnter event, cause the other plugins are loaded then.
call dein#add('vim-airline/vim-airline', {
      \ 'on_event': 'VimEnter'
      \ })

call dein#add('t9md/vim-choosewin', {
      \ 'on_cmd': ['ChooseWin', 'ChooseWinSwap', 'ChooseWinSwapStay'],
      \ 'on_func':'choosewin#start'
      \ })

call dein#add('Raimondi/delimitMate', {
      \ 'on_event': 'InsertEnter'
      \ })

call dein#add('Shougo/denite.nvim', {
      \ 'on_cmd': 'Denite'
      \ })

" TODO
call dein#add('wincent/ferret', {
      \ 'on_cmd': ['Ack', 'Lack', 'Back', 'Black']
      \ })

call dein#add('Yggdroot/indentLine', {
      \ 'name': 'indent-line'
      \ })

" TODO
call dein#add('junegunn/limelight.vim', {
      \ 'on_event': 'GoyoEnter'
      \ })

call dein#add('scrooloose/nerdtree', {
      \ 'on_cmd': ['NERDTree', 'NERDTreeToggle', 'NERDTreeFromBookmark', 'NERDTreeFocus']
      \ })

call dein#add('Xuyuanp/nerdtree-git-plugin', {
      \ 'on_source': 'nerdtree'
      \ })

call dein#add('tiagofumo/vim-nerdtree-syntax-highlight', {
      \ 'on_source': 'nerdtree'
      \ })

call dein#add('kien/tabman.vim', {
      \ 'on_cmd': ['TMToggle', 'TMFocus']
      \ })

call dein#add('majutsushi/tagbar', {
      \ 'on_cmd': ['TagbarOpen', 'TagbarToggle']
      \ })

call dein#add('mbbill/undotree', {
      \ 'on_cmd': 'UndoTreeToggle'
      \ })

call dein#add('Valloric/MatchTagAlways', {
      \ 'name': 'matchtagalways',
      \ 'on_ft': ['html', 'xml', 'vue', 'jsx']
      \ })

call dein#add('alvan/vim-closetag', {
      \ 'on_ft': ['html', 'xml', 'vue', 'jsx']
      \ })

call dein#add('AndrewRadev/splitjoin.vim', {
      \ 'on_cmd': ['SplitjoinJoin', 'SplitjoinSplit']
      \ })

call dein#add('cohama/agit.vim', {
      \ 'depends': 'vim-fugitive',
      \ 'on_cmd': ['Agit', 'AgitFile']
      \ })

call dein#add('sodapopcan/vim-twiggy', {
      \ 'depends': 'vim-fugitive',
      \ 'on_cmd': 'Twiggy'
      \ })


" source $HOME/.vim/runtime-configuration/plugin-configuration/deoplete.vim
" source $HOME/.vim/runtime-configuration/plugin-configuration/vim-session.vim
" source $HOME/.vim/runtime-configuration/plugin-configuration/markdown.vim


" Further plugins without their own configuration:
"    - misc (required for vim-session)
"    - tabular (especially used in vim-markdown)
"

" Add hooks for all plugins.
call dein#set_hook([], 'hook_add', function('AddHook'))
call dein#set_hook([], 'hook_source', function('LoadConfig'))
call dein#set_hook([], 'hook_post_source', function('PostSourceHook'))

call dein#end()
"call dein#recache_runtimepath()
"call dein#save_state()
"endif

" Must be set again, cause dein unset it.
filetype plugin on

if has('nvim')
  " Instead of manually call ':UpdateRemotePlugins'
  call dein#remote_plugins()
endif


" Autocommand to install new plugins or update already existing ones.
augroup DeinUpdate
  autocmd!

  " Check for uninstalled plugins.
  autocmd VimEnter * if dein#check_install() | call dein#install() | endif

  " Check for updates and install them.
  " TODO: Asynchronously not work that good, cause can't work during this.
  " autocmd VimEnter * call dein#check_update()
augroup END
