setlocal nowrap
let b:undo_ftplugin .= '|setlocal wrap<'

setlocal nobuflisted
let b:undo_ftplugin .= '|setlocal buflisted<'
