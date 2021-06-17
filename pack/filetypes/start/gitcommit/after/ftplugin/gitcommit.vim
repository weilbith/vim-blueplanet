if !exists('b:undo_ftplugin')
  let b:undo_ftplugin = 'setlocal'
else
  let b:undo_ftplugin .= '| setlocal' 
endif

setlocal spell
let b:undo_ftplugin .= 'spell<'
