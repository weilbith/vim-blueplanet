if !exists('b:undo_ftplugin')
  let b:undo_ftplugin = ''
endif

let b:delimitMate_nesting_quotes = ['`']
let b:undo_ftplugin .= '| unlet b:delimitMate_nesting_quotes'
