if exists('b:did_ftplugin')
  finish
endif

let b:did_ftplugin = 1

let s:save_cpoptions = &cpoptions
set cpoptions&vim

let b:undo_ftplugin = 'setlocal'


nnoremap <buffer> <silent> q :bw<CR>
let b:undo_ftplugin .= '|nunmap <buffer> q'


let &cpoptions = s:save_cpoptions
unlet s:save_cpoptions
