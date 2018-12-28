setlocal suffixesadd+=.js
let b:undo_ftplugin .= '|setlocal suffixesadd<'

setlocal iskeyword+=$
let b:undo_ftplugin .= '|setlocal iskeyword<'
