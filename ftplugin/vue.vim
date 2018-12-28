if exists('b:did_ftplugin')
  finish
endif

let b:did_ftplugin = 1
let s:save_cpoptions = &cpoptions
set cpoptions&vim

let b:undo_ftplugin = 'setlocal'


setlocal suffixesadd+=.vue
let b:undo_ftplugin .= ' suffixesadd<'


let &cpoptions = s:save_cpoptions
unlet s:save_cpoptions
