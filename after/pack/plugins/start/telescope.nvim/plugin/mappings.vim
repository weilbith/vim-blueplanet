" Files
nnoremap <leader>ff <cmd>Telescope find_files<CR>
nnoremap <leader>fb <cmd>Telescope find_files cwd=expand('%:p:h')<CR>

" Buffers
nnoremap <leader>bb <cmd>Telescope buffers<CR>

" Search
nnoremap <leader>ss <cmd>Telescope live_grep<CR>
nnoremap <leader>sS <cmd>Telescope live_grep cwd=expand('%:p:h')<CR>
nnoremap <leader>sw <cmd>Telescope grep_string<CR>
nnoremap <leader>sr <cmd>Telescope resume<CR>
nnoremap <leader>sR <cmd>Telescope pickers<CR>

" LSP
nnoremap <leader>gO <cmd>Telescope lsp_document_symbols<CR>
nnoremap <leader>to <cmd>Telescope lsp_workspace_symbols<CR>

" Git
nnoremap <leader>gll <cmd>Telescope git_commits<CR>
nnoremap <leader>glL <cmd>Telescope git_bcommits<CR>
nnoremap <leader>gc <cmd>Telescope git_branches<CR>

" Lists
nnoremap <leader>qf <cmd>Telescope quickfix<CR>
nnoremap <leader>lf <cmd>Telescope loclist<CR>

" Commandline
cnoremap <expr> he getcmdtype() ==# ':' && getcmdpos() == 1 ? 'Telescope help_tags<CR>' : 'he'
