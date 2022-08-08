if !exists('b:undo_ftplugin')
  let b:undo_ftplugin = ''
endif

nnoremap <buffer> <leader>rr <cmd>JavaUtil lsp_rename<CR>
let b:undo_ftplugin .= '| nunmap <buffer> <leader>rr'
