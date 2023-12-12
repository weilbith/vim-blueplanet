if !exists('b:undo_ftplugin')
  let b:undo_ftplugin = ''
endif

nnoremap <buffer> <leader>rr <cmd>JavaUtil lsp_rename<CR>
let b:undo_ftplugin .= '| nunmap <buffer> <leader>rr'

nnoremap <buffer> <localleader>tg <cmd>JavaUtil lsp_goto_test<CR>
let b:undo_ftplugin .= '| nunmap <buffer> <localleader>tg'
