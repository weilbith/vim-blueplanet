scriptencoding utf-8

let g:neomake_open_list = 2 " Don't jump to the quickfix/location window automatically.
let g:neomake_highlight_lines = 1

" Enabled makers
let g:neomake_java_enabled_makers = ['ant']
let g:neomake_vim_enabled_makers = ['vint']
let g:neomake_solidity_enabled_makers = ['solium']
let g:neomake_json_enabled_makers = ['jsonlint']
let g:neomake_javascript_enabled_makers = ['eslint']
let g:neomake_typescript_enabled_makers = ['tslint']
let g:neomake_tex_enabled_makers = ['lacheck', 'proselint']
let g:neomake_toml_enabled_makers = ['tomlcheck']

" Modify makers.
let g:neomake_javascript_eslint_exe = 'eslint'
let g:neomake_typescript_tslint_exe = 'tslint'
let g:neomake_tex_lacheck_cwd = '%:p:h'
let g:neomake_tex_pdflatex_cwd = '%:p:h'

" Define own maker.
" Make pdflatex file-type independent, so it can be used form plaintex as
" well.
let g:neomake_pdflatex_maker = {
      \ 'args': ['-shell-escape', '-file-line-error', '-interaction', 'nonstopmode'],
      \ 'errorformat': '%E%f:%l: %m'
      \ }


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


" Autocommands
augroup NEOMAKE_ESLINT
  autocmd!

  " Switch the linter(s) to projects local configuration.
  autocmd DirChanged * call <SID>switch_js_linter()
augroup END




" Functions

" Determine if the current device is running on battery.
" Hardy depends on the device and OS!!!
"
function! s:is_on_battery()
  return readfile('/sys/class/power_supply/AC/online') == ['0']
endfunction

" Configure automake depending on the device.
if s:is_on_battery()
  call neomake#configure#automake('w')
else
  call neomake#configure#automake('nw', 10000)
endif


" List of linters to use for javascript languages.
" First entry is the variable name for the NeoMake setting.
" Second entry is the name of the binary.
" Third entry is used to backup settings between changes.
let g:js_linter = [
      \   ['neomake_javascript_eslint_exe', 'eslint', ''],
      \   ['neomake_typescript_tslint_exe', 'tslint', '']
      \ ]
"
" Function to switch the linter executable for javascript languages.
" This is necessary to call the project local linter with its configuration.
" Will be used by an auto command to switch this automatically.
"
function! s:switch_js_linter()
  for l:linter in g:js_linter
    " The theoretically path to the linter binaries.
    let l:binaries = getcwd() . '/node_modules/.bin/' . l:linter[1]
    let l:readable = filereadable(l:binaries)

    " Check if the binaries exists and use it then.
    if l:readable
      let l:current = get(g:, l:linter[0], '')

      " Backup the old setting if it exists.
      if len(l:current) > 0
        let l:linter[2] = l:current
      endif

      " Set the binaries to use as executable.
      execute 'let g:' . l:linter[0] . ' = "' . l:binaries . '"'

    " Reset the executable to the global one if has been scoped local before.
    elseif len(l:linter[2]) > 0
      execute 'let g:' . l:linter[0] . ' = "' . l:linter[2] . '"'
      let l:linter[2] = ''

    endif
  endfor
endfunction
