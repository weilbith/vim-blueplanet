if !exists('b:undo_ftplugin')
  let b:undo_ftplugin = 'setlocal'
else
  let b:undo_ftplugin .= '| setlocal' 
endif

setlocal foldcolumn=0
let b:undo_ftplugin .= 'foldcolumn<'

setlocal foldlevel=99
let b:undo_ftplugin .= 'foldlevel<'

setlocal nowrap
let b:undo_ftplugin .= 'wrap<'
