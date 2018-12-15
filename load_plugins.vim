let s:dein_base_folder = '~/.cache/dein'

" Load dein's configuration itself.
execute 'source ' . g:plugin_configuration_folder . '/dein.vim'

" Define list of all configuration files of interest for the caching.
let s:vimrcs = split(expand(g:plugin_configuration_folder . '/*.vim')) " All configurations for each plugin.
let s:vimrcs = add(s:vimrcs, expand('<sfile>')) " This file itself.


" AddHook dein.vim as plugin manager.
execute 'set runtimepath+=' . s:dein_base_folder . '/repos/github.com/Shougo/dein.vim'

" AddHook all plugins and their configurations.
"if dein#load_state(s:dein_base_folder)
call dein#begin(s:dein_base_folder, s:vimrcs)

call dein#add('Shougo/dein.vim')
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
call dein#add('romainl/vim-cool')
call dein#add('mhinz/vim-startify')
call dein#add('xolox/vim-misc')
call dein#add('t9md/vim-choosewin')
call dein#add('Shougo/context_filetype.vim')
call dein#add('jeetsukumaran/vim-pythonsense')
call dein#add('zhimsel/vim-stay')
call dein#add('editorconfig/editorconfig-vim')

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

call dein#add('ryanoasis/vim-devicons', {
      \ 'on_source': 'vim-airline'
      \ })

call dein#add('Raimondi/delimitMate', {
      \ 'name': 'delimit_mate',
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
      \ 'name': 'indent_line'
      \ })

" TODO
call dein#add('junegunn/limelight.vim', {
      \ 'on_event': 'GoyoEnter'
      \ })

call dein#add('scrooloose/nerdtree', {
      \ 'on_cmd': ['NERDTree', 'NERDTreeToggle', 'NERDTreeFromBookmark', 'NERDTreeFocus']
      \ })

call dein#add('Xuyuanp/nerdtree-git-plugin', {
      \ 'name': 'nerdtree_git_plugin',
      \ 'on_source': 'nerdtree'
      \ })
" call dein#add('/home/thore/Projects/vim/nerdtree-git-plugin')

call dein#add('tiagofumo/vim-nerdtree-syntax-highlight', {
      \ 'name': 'nerdtree_syntax_highlight',
      \ 'on_source': 'nerdtree'
      \ })

call dein#add('weilbith/nerdtree_choosewin-plugin', {
      \ 'on_source': 'nerdtree'
      \ })

call dein#add('kien/tabman.vim', {
      \ 'on_cmd': ['TMToggle', 'TMFocus']
      \ })

call dein#add('majutsushi/tagbar', {
      \ 'on_cmd': ['TagbarOpen', 'TagbarToggle']
      \ })
" call dein#add('/home/thore/Projects/vim/tagbar')

call dein#add('mbbill/undotree', {
      \ 'on_cmd': 'UndoTreeToggle'
      \ })

call dein#add('Valloric/MatchTagAlways', {
      \ 'name': 'match_tag_always',
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

call dein#add('brooth/far.vim', {
      \ 'on_cmd': ['Far', 'Farp']
      \ })

call dein#add('xolox/vim-session', {
      \ 'depends': 'vim-misc'
      \ })

call dein#add('Shougo/deoplete.nvim', {
      \ 'on_event': 'InsertEnter'
      \ })

call dein#add('fszymanski/deoplete-emoji', {
      \ 'on_ft': ['gitcommit', 'markdown', 'mail', 'text']
      \ })

call dein#add('zchee/deoplete-jedi', {
      \ 'name': 'deoplete_jedi',
      \ 'on_ft': ['python']
      \ })

call dein#add('Shougo/neco-vim', {
      \ 'name': 'deoplete_neco',
      \ 'on_ft': ['vim']
      \ })

call dein#add('tenfyzhong/CompleteParameter.vim', {
      \ 'name': 'complete_parameter'
      \ })

call dein#add('mxw/vim-jsx', {
      \ 'on_ft': ['js', 'jsx']
      \ })

call dein#add('echuraev/translate-shell.vim', {
      \ 'name': 'translate_shell',
      \ 'on_cmd': ['Trans', 'TransSelectDirection', 'TransInteractive', 'TransTerm', 'TransOpenHistoryWindow']
      \ })

call dein#add('mtth/scratch.vim', {
      \ 'on_cmd': ['Scratch', 'ScratchInsert', 'ScratchSelection', 'ScratchPreview']
      \ })

call dein#add('rhysd/vim-grammarous', {
      \ 'on_cmd': 'GrammarousCheck'
      \ })

call dein#add('tmhedberg/SimpylFold', {
      \ 'name': 'simpyl_fold',
      \ 'build': 'rm -rf plugin/'
      \ })

call dein#add('davidhalter/jedi-vim', {
      \ 'on_ft': ['python']
      \ })

call dein#add('thinca/vim-quickrun', {
      \ 'on_cmd': ['QuickRun']
      \ })

call dein#add('dbeniamine/cheat.sh-vim', {
      \ 'name': 'cheat_sheet',
      \ 'on_func': ['cheat#cheat']
      \ })

call dein#add('zchee/deoplete-zsh', {
      \ 'on_ft': ['sh', 'zsh']
      \ })

call dein#add('ternjs/tern_for_vim', {
      \ 'name': 'tern',
      \ 'build': 'yarn install',
      \ 'on_ft': ['javascript', 'jsx', 'vue']
      \ })

call dein#add('carlitux/deoplete-ternjs', {
      \ 'on_ft': ['javascript', 'jsx', 'vue']
      \ })

" Add hooks for all plugins.
call dein#set_hook([], 'hook_add', function('plugin#dein#add_hook'))
call dein#set_hook([], 'hook_source', function('plugin#dein#load_config'))
call dein#set_hook([], 'hook_post_source', function('plugin#dein#post_source_hook'))

call dein#end()
call dein#recache_runtimepath()
call dein#save_state()
"endif

" Must be set again, cause dein unset it.
filetype plugin on

if has('nvim')
  " Instead of manually call ':UpdateRemotePlugins'
  call dein#remote_plugins()
endif
