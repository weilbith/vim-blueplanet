if !exists('b:undo_ftplugin')
  let b:undo_ftplugin = ''
endif

setlocal nowrap
let b:undo_ftplugin .= '|setlocal wrap<'

setlocal nobuflisted
let b:undo_ftplugin .= '|setlocal buflisted<'
