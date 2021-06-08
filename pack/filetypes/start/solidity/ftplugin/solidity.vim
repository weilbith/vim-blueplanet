if exists('b:did_ftplugin')
  finish
endif

let b:did_ftplugin = 1

let s:save_cpoptions = &cpoptions
set cpoptions&vim

let b:undo_ftplugin = 'setlocal'


setlocal comments=sO:*\ -,mO:*\ \ ,exO:*/,s1:/*,mb:*,ex:*/,://
let b:undo_ftplugin .= ' comments<'

setlocal commentstring=//\ %s
let b:undo_ftplugin .= ' commentstring<'

setlocal formatoptions+=ro
let b:undo_ftplugin .= ' formatoptions<'

setlocal shiftwidth=4
let b:undo_ftplugin .= ' shiftwidth<'

setlocal tabstop=4
let b:undo_ftplugin .= ' tabstop<'

setlocal softtabstop=4
let b:undo_ftplugin .= ' softtabstop<'


let &cpoptions = s:save_cpoptions
unlet s:save_cpoptions
