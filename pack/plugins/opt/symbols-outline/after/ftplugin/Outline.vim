if !exists('b:undo_ftplugin')
  let b:undo_ftplugin = ''
endif

setlocal nospell
let b:undo_ftplugin .= 'spell<'

setlocal nowrap
let b:undo_ftplugin .= 'wrap<'
