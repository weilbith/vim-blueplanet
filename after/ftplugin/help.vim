setlocal concealcursor=c
let b:undo_ftplugin .= ' concealcursor<'

nnoremap <buffer> <silent> q :close<CR>
let b:undo_ftplugin .= '|nunmap <buffer> q'
