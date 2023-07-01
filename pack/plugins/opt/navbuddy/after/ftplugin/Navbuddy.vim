if exists('b:did_ftplugin')
  finish
endif

let b:did_ftplugin = 1

let s:save_cpoptions = &cpoptions
set cpoptions&vim

let b:undo_ftplugin = ''

nnoremap <buffer> f <cmd>Telescope lsp_document_symbols<CR>
let b:undo_ftplugin .= '| nunmap <buffer> f'
