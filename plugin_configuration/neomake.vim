scriptencoding utf-8

let g:neomake_open_list = 2 " Don't jump to the quickfix/location window automatically.
let g:neomake_highlight_lines = 1
let g:neomake_echo_current_error = 1
let g:neomake_virtualtext_current_error = 1
let g:neomake_virtualtext_prefix = ''

" Enabled makers
let g:neomake_java_enabled_makers = ['ant']
let g:neomake_sh_enabled_makers = ['shellcheck']
let g:neomake_zsh_enabled_makers = ['zsh']
let g:neomake_vim_enabled_makers = ['vint']
let g:neomake_solidity_enabled_makers = ['solium']
let g:neomake_json_enabled_makers = ['jsonlint']
let g:neomake_javascript_enabled_makers = ['eslint']
let g:neomake_typescript_enabled_makers = ['eslint', 'tsc']
let g:neomake_tex_enabled_makers = ['lacheck', 'proselint']
let g:neomake_bib_enabled_makers = ['bibtex']
let g:neomake_toml_enabled_makers = ['tomlcheck']
let g:neomake_python_enabled_makers = ['flake8', 'mypy']
let g:neomake_rust_enabled_makers = ['cargo']
let g:neomake_terraform_enabled_makers = ['tflint']
let g:neomake_packer_enabled_makers = ['packer_validate']
let g:neomake_lua_enabled_makers = ['luacheck']


" Modify makers.
let g:neomake_javascript_eslint_exe = 'eslint'
let g:neomake_typescript_eslint_exe = 'eslint'
let g:neomake_tex_lacheck_cwd = '%:p:h'
let g:neomake_tex_pdflatex_cwd = '%:p:h'

" Define own maker.
" Make pdflatex file-type independent, so it can be used form plaintex as
" well.
let g:neomake_pdflatex_maker = {
      \ 'args': ['-shell-escape', '-file-line-error', '-interaction', 'nonstopmode'],
      \ 'errorformat': '%E%f:%l: %m'
      \ }

let g:neomake_terraform_tflint_maker = {
      \ 'exe' : 'tflint',
      \ 'cwd': '%:p:h',
      \ 'args': [],
      \ 'errorformat': '%+P%f,%p%t%*[^:]:%l %m,%-Q'
      \ }

let g:neomake_packer_packer_validate_maker = {
      \ 'exe' : 'packer',
      \ 'cwd': '%:p:h',
      \ 'args': ['validate'],
      \ 'errorformat': '%+P%f,%p%t%*[^:]:%l %m,%-Q'
      \ }


" Configure neomake depending on the device.
if plugin#neomake#is_on_battery()
  call neomake#configure#automake('w')
else
  call neomake#configure#automake('nw', 10000)
endif


" Style
let g:neomake_error_sign = {
      \ 'text': '✖',
      \ 'texthl': 'NeomakeErrorSign'
      \ }

let g:neomake_warning_sign = {
      \ 'text': '⚠',
      \ 'texthl': 'NeomakeWarningSign'
      \ }

let g:neomake_info_sign = {
      \ 'text': '',
      \ 'texthl': 'NeomakeInfoSign'
      \ }

let g:neomake_message_sign = {
      \   'text': '',
      \   'texthl': 'NeomakeMessageSign',
      \ }


" Highlights
highlight NeomakeError       ctermbg=NONE ctermfg=197 guibg=NONE guifg=#ff005f cterm=reverse gui=reverse
highlight NeomakeErrorSign   ctermbg=NONE ctermfg=197 guibg=NONE guifg=#ff005f cterm=bold    gui=bold

highlight NeomakeWarning     ctermbg=NONE ctermfg=214 guibg=NONE guifg=#F5BB12 cterm=reverse gui=reverse
highlight NeomakeWarningSign ctermbg=NONE ctermfg=214 guibg=NONE guifg=#F5BB12 cterm=NONE    gui=NONE

highlight NeomakeInfo        ctermbg=NONE ctermfg=191 guibg=NONE guifg=#d7ff5f cterm=reverse gui=reverse
highlight NeomakeInfoSign    ctermbg=NONE ctermfg=191 guibg=NONE guifg=#d7ff5f cterm=bold    gui=bold

highlight NeomakeMessage     ctermbg=NONE ctermfg=32  guibg=NONE guifg=#0087d7 cterm=reverse gui=reverse
highlight NeomakeMessageSign ctermbg=NONE ctermfg=32  guibg=NONE guifg=#0087d7 cterm=bold    gui=bold


" There is also neomake related stuff in the autocommands plugin as well as in
" the autoload class utils#neomake.
