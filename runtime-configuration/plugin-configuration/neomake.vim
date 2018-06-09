scriptencoding utf-8

let g:neomake_open_list = 2 " Don't jump to the quickfix/location window automatically.
let g:neomake_highlight_lines = 1

" Enabled markers
let g:neomake_java_enabled_markers = ['ant']
let g:neomake_vim_enabled_markers = ['vint']
let g:neomake_solidity_enabled_markers = ['solium']
let g:neomake_json_enabled_markers = ['jsonlint']
let g:neomake_javascript_enabled_markers = ['eslint']

" Define executables.
let g:neomake_javascript_eslint_exe = 'eslint'


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

  " Switch the ESLinter to projects local configuration.
  autocmd DirChanged * call <SID>switch_eslint()
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
  call neomake#configure#automake('nw', 1000)
endif


" Function to switch the ESLinter executable.
" This is necessary to call the project local linter with its configuration.
" Will be used by an auto command to switch this automatically.
"
function! s:switch_eslint()
  " The theoretically path to the ESLint binary.
  let l:eslint = getcwd() . '/node_modules/.bin/eslint'
  let l:readable = filereadable(l:eslint)
  echom l:eslint

  " Check if the binary exists and use it then.
  " if filereadable(l:eslint)
  if l:readable
    " Backup the old setting if it exists.
    if exists('g:neomake_javascript_eslint_exe')
      let g:neomake_javascript_eslint_exe_backup = g:neomake_javascript_eslint_exe
    endif

    let g:neomake_javascript_eslint_exe = l:eslint

  " Reset the executable to the global one if has been scoped local before.
  elseif exists('g:neomake_javascript_eslint_exe_backup')
    let g:neomake_javascript_eslint_exe = g:neomake_javascript_eslint_exe_backup
    unlet g:neomake_javascript_eslint_exe_backup

  endif
endfunction
