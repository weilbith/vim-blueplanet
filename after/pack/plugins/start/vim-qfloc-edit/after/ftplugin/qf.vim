if !exists('b:undo_ftplugin')
  let b:undo_ftplugin = ''
endif

packadd vim-qfloc-edit

nnoremap <buffer> dd <cmd>RemoveEntryUnderCursorInCurrentListWindow<CR>
let b:undo_ftplugin .= '| nunmap <buffer> dd'

nnoremap <buffer> u <cmd>UndoLastEntryRemovalInCurrentListWindow<CR>
let b:undo_ftplugin .= '| nunmap <buffer> u'

setlocal winfixbuf
