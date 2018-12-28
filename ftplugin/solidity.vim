if exists('b:did_ftplugin')
  finish
endif

let b:did_ftplugin = 1

let s:save_cpoptions = &cpoptions
set cpoptions&vim

let b:undo_ftplugin = 'setlocal'


" Define the comment options.
setlocal comments=sO:*\ -,mO:*\ \ ,exO:*/,s1:/*,mb:*,ex:*/,://
let b:undo_ftplugin .= ' comments<'

setlocal commentstring=//\ %s
let b:undo_ftplugin .= ' commentstring<'


" Complete comments on new line.
setlocal formatoptions+=ro
let b:undo_ftplugin .= ' formatoptions<'


let &cpoptions = s:save_cpoptions
unlet s:save_cpoptions
