nnoremap gd <cmd>lua require('nvim-treesitter-refactor.navigation').goto_definition()<CR>
nnoremap ]r <cmd>lua require('nvim-treesitter-refactor.navigation').goto_next_usage()<CR>
nnoremap [r <cmd>lua require('nvim-treesitter-refactor.navigation').goto_previous_usage()<CR>
