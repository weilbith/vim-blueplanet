nnoremap <space>dc <cmd>lua require('dap').continue()<CR>
nnoremap <space>dC <cmd>lua require('dap').run_last()<CR>
nnoremap <space>di <cmd>lua require('dap').step_into({ askForTargets = true })<CR>
nnoremap <space>dn <cmd>lua require('dap').step_over({ askForTargets = true })<CR>
nnoremap <space>do <cmd>lua require('dap').step_out({ askForTargets = true })<CR>
nnoremap <space>dB <cmd>lua require('dap').step_back()<CR>
nnoremap <space>dg <cmd>lua require('dap').run_to_cursor()<CR>
nnoremap <space>dq <cmd>lua require('dap').disconnect()<CR>
