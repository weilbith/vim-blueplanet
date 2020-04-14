if exists('b:did_ftplugin')
  finish
endif

let b:did_ftplugin = 1

let s:save_cpoptions = &cpoptions
set cpoptions&vim

let b:undo_ftplugin = 'setlocal'


" Switch to normal mode (double because of zsh vi-mode)
tnoremap <buffer> <Esc><Esc> <C-\><C-n>
let b:undo_ftplugin .= '|tunmap <buffer> <Esc><Esc>'

" Close terminal directly
tnoremap <buffer> <C-q> <C-\><C-n>:close<CR>
let b:undo_ftplugin .= '|tunmap <buffer> <C-q>'

nnoremap <C-q> :close<CR>
let b:undo_ftplugin .= '|nunmap <buffer> <C-q>'


let &cpoptions = s:save_cpoptions
unlet s:save_cpoptions
