nnoremap <localleader>tn <cmd>Neotest run<CR>
nnoremap <localleader>td <cmd>Neotest run strategy=dap<CR>
nnoremap <localleader>tf <cmd>Neotest run file<CR>
nnoremap <localleader>tS <cmd>Neotest run suite=true<CR>
nnoremap <localleader>ta <cmd>Neotest attach<CR>
nnoremap <localleader>to <cmd>Neotest output enter=true<CR>
nnoremap <localleader>tO <cmd>Neotest output-panel toggle<CR>
nnoremap <localleader>tx <cmd>Neotest stop<CR>
nnoremap <localleader>ts <cmd>Neotest summary toggle<CR>

nnoremap ]t <cmd>Neotest jump next<CR>
nnoremap ]T <cmd>Neotest jump next status=failed<CR>
nnoremap [t <cmd>Neotest jump prev<CR>
nnoremap [T <cmd>Neotest jump prev status=failed<CR>
