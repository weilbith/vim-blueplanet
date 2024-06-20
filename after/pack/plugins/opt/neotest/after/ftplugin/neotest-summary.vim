if !exists('b:undo_ftplugin')
  let b:undo_ftplugin = ''
endif

setlocal nowrap
let b:undo_ftplugin .= 'wrap<'

setlocal foldcolumn=0
let b:undo_ftplugin .= 'foldcolumn<'

setlocal winfixbuf
