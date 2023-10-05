nnoremap <space>di <cmd>lua require('dap').step_into({ steppingGranularity = "line" })<CR>
nnoremap <space>dI <cmd>lua require('dap').step_into({ askForTargets = true })<CR>
nnoremap <space>dn <cmd>lua require('dap').step_over()<CR>
nnoremap <space>dN <cmd>lua require('dap').step_over({ askForTargets = true })<CR>
nnoremap <space>do <cmd>lua require('dap').step_out()<CR>
nnoremap <space>dO <cmd>lua require('dap').step_out({ askForTargets = true })<CR>
nnoremap <space>dB <cmd>lua require('dap').step_back()<CR>
nnoremap <space>dg <cmd>lua require('dap').goto_()<CR>
nnoremap <space>dc <cmd>lua require('dap').disconnect()<CR>
