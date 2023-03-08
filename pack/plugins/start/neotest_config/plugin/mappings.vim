nnoremap <localleader>tn <cmd>lua require('neotest').run.run()<CR>
nnoremap <localleader>td <cmd>lua require('neotest').run.run({ strategy = "dap" })<CR>
nnoremap <localleader>tm <cmd>lua require('neotest').summary.run_marked()<CR>
nnoremap <localleader>tf <cmd>lua require('neotest').run.run(vim.fn.expand('%'))<CR>
nnoremap <localleader>tS <cmd>lua require('neotest').run.run({ suite = true })<CR>
nnoremap <localleader>ta <cmd>lua require('neotest').run.attach()<CR>
nnoremap <localleader>to <cmd>lua require('neotest').output.open({ enter = true })<CR>
nnoremap <localleader>tO <cmd>lua require('neotest').output_panel.toggle()<CR>
nnoremap <localleader>tx <cmd>lua require('neotest').run.stop()<CR>
nnoremap <localleader>ts <cmd>lua require('neotest').summary.toggle()<CR>

nnoremap ]t <cmd>lua require("neotest").jump.next()<CR>
nnoremap ]T <cmd>lua require("neotest").jump.next({ status = "failed" })<CR>
nnoremap [t <cmd>lua require("neotest").jump.prev()<CR>
nnoremap [T <cmd>lua require("neotest").jump.prev({ status = "failed" })<CR>
