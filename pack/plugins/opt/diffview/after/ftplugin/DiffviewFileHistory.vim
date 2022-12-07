if !exists('b:undo_ftplugin')
  let b:undo_ftplugin = ''
endif

nnoremap <buffer> q <cmd>DiffviewClose<CR>
let b:undo_ftplugin .= '| nunmap <buffer> q'
