if !exists('b:undo_ftplugin')
  let b:undo_ftplugin = ''
endif

setlocal winhighlight=Normal:NormalSpecialBuffer
let b:undo_ftplugin .= '|setlocal winhighlight<'
