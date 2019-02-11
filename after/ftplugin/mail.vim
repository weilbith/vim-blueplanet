if !exists('b:undo_ftplugin')
  let b:undo_ftplugin = ''
endif

setlocal spelllang=de
let b:undo_ftplugin .= '|setlocal spelllang<'
