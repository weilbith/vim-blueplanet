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
call dein#add('kana/vim-submode')
call dein#add('sbdchd/neoformat')
call dein#add('mhinz/vim-signify')
call dein#add('airblade/vim-rooter')
call dein#add('easymotion/vim-easymotion')
call dein#add('tpope/vim-surround')
call dein#add('gko/vim-coloresque')
call dein#add('tpope/vim-repeat')
call dein#add('kshenoy/vim-signature')
call dein#add('wellle/targets.vim')
call dein#add('tommcdo/vim-exchange')
call dein#add('romainl/vim-cool')
call dein#add('mhinz/vim-startify')
call dein#add('t9md/vim-choosewin')
call dein#add('zhimsel/vim-stay')
call dein#add('ryanoasis/vim-devicons')
call dein#add('psliwka/vim-smoothie')
call dein#add('junegunn/vim-peekaboo')
call dein#add('voldikss/vim-floaterm')
call dein#add('neovim/nvim-lsp')
call dein#add('weilbith/vim-localrc')
call dein#add('haorenW1025/completion-nvim')
call dein#add('SirVer/ultisnips')
" call dein#add('weilbith/nvim-lsp-diamove')
call dein#add('weilbith/nvim-lsp-bacomp')
call dein#add('weilbith/nvim-lsp-smag')
call dein#add('weilbith/vim-loche')
call dein#add('weilbith/vim-qfloc-tailor')
call dein#add('haya14busa/vim-asterisk')
call dein#add('nvim-treesitter/nvim-treesitter')

call dein#add('glacambre/firenvim', {
      \ 'hook_post_update': 'call firenvim#install(0)'
      \ })

call dein#add('KabbAmine/vCoolor.vim', {
      \ 'name': 'vcoolor',
      \ 'on_cmd': ['VCoolor', 'VCoolIns']
      \ })

call dein#add('itchyny/lightline.vim', {
      \ 'on_event': 'VimEnter',
      \ 'depends': ['vim-fugitive', 'neomake', 'denite.nvim', 'vim-signify']
      \ })

call dein#add('mengelbrecht/lightline-bufferline', {
      \ 'depends': 'lightline.vim'
      \ })

call dein#add('Raimondi/delimitMate', {
      \ 'name': 'delimit_mate',
      \ 'on_event': 'InsertEnter'
      \ })

call dein#add('Shougo/denite.nvim', {
      \ 'on_cmd': 'Denite'
      \ })

call dein#add('Yggdroot/indentLine', {
      \ 'name': 'indent_line'
      \ })

call dein#add('scrooloose/nerdtree', {
      \ 'on_cmd': ['NERDTree', 'NERDTreeToggle', 'NERDTreeFromBookmark', 'NERDTreeFocus']
      \ })

call dein#add('Xuyuanp/nerdtree-git-plugin', {
      \ 'name': 'nerdtree_git_plugin',
      \ 'on_source': 'nerdtree'
      \ })

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

call dein#add('cohama/agit.vim', {
      \ 'depends': 'vim-fugitive',
      \ 'on_cmd': ['Agit', 'AgitFile']
      \ })

call dein#add('weilbith/vim-rhubarb', {
      \ 'depends': 'vim-fugitive',
      \ 'on_ft': ['gitcommit']
      \ })

call dein#add('sodapopcan/vim-twiggy', {
      \ 'depends': 'vim-fugitive',
      \ 'on_cmd': 'Twiggy'
      \ })

call dein#add('brooth/far.vim', {
      \ 'on_cmd': ['Far', 'Farp']
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

call dein#add('thinca/vim-quickrun', {
      \ 'on_cmd': ['QuickRun']
      \ })

call dein#add('liuchengxu/vim-which-key', {
      \ 'on_cmd': ['WhichKey', 'WhichKeyVisual'],
      \ })

call dein#add('rhysd/git-messenger.vim', {
      \   'lazy' : 1,
      \   'on_cmd' : 'GitMessenger',
      \   'on_map' : '<Plug>(git-messenger',
      \ })

call dein#add('skywind3000/asyncrun.vim', {
      \ 'on_cmd': ['AsyncRun'],
      \ })

call dein#add('janko/vim-test', {
      \ 'on_cmd': ['TestNearest', 'TestFile', 'TestSuite', 'TestLast', 'TestVisit'],
      \ })

call dein#add('mcchrish/info-window.nvim', {
      \ 'on_cmd': ['InfoWindowToggle'],
      \ 'on_func': ['infowindow#toggle']
      \ })

call dein#add('liuchengxu/vista.vim', {
      \ 'on_cmd': 'Vista',
      \ 'on_func': ['vista#', 'vista#RunForNearestMethodOrFunction']
      \ })

call dein#add('weilbith/nvim-lsp-denite', {
      \ 'depends': 'denite.nvim'
      \ })

call dein#add('weilbith/vim-quickname', {
      \ 'on_cmd': ['QuicknameSave', 'QuicknameLoad', 'QuicknameRemove']
      \ })

call dein#add('Shougo/neoyank.vim', {
      \ 'depends': 'denite.nvim'
      \ })

" call dein#add('/home/thore/projects/vim-projects/vista.vim')
" call dein#add('/home/thore/projects/vim-projects/vim-yank-history')
" call dein#add('/home/thore/Projects/vim/nerdtree-git-plugin')
" call dein#add('/home/thore/projects/vim-projects/vim-localrc')
" call dein#add('/home/thore/projects/vim-projects/nvim-lsp-denite')
call dein#add('/home/thore/projects/vim-projects/nvim-lsp-diamove')
call dein#add('/home/thore/projects/vim-projects/nvim-lsp-bacomp')
" call dein#add('/home/thore/projects/vim-projects/nvim-lsp-smag')
" call dein#add('/home/thore/projects/vim-projects/vim-loche')
" call dein#add('/home/thore/projects/vim-projects/vim-qfloc-tailor')
" call dein#add('/home/thore/projects/vim-projects/vim-quickname')
" call dein#add('/home/thore/projects/vim-projects/vim-denite-qfloc')

" Add hooks for all plugins.
call dein#set_hook([], 'hook_add', 'call plugin#dein#add_hook()')
call dein#set_hook([], 'hook_source', 'call plugin#dein#load_config()')
call dein#set_hook([], 'hook_post_source', 'call plugin#dein#post_source_hook()')

call dein#end()
" call dein#recache_runtimepath()
call dein#save_state()
"endif


" Must be set again, cause dein unset it.
filetype plugin on

if has('nvim')
  " Instead of manually call ':UpdateRemotePlugins'
  call dein#remote_plugins()
endif
