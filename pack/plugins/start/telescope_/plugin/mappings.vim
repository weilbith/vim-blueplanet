" Files
nnoremap <leader>ff <cmd>Telescope find_files<CR>
nnoremap <leader>fb <cmd>Telescope find_files cwd=expand('%:p:h')<CR>

" Buffers
nnoremap <leader>bb <cmd>Telescope buffers<CR>

" Search
nnoremap <leader>ss <cmd>Telescope live_grep<CR>
nnoremap <leader>sS <cmd>Telescope live_grep cwd=expand('%:p:h')<CR>
nnoremap <leader>sw <cmd>Telescope grep_string<CR>

" LSP
nnoremap <leader>tr <cmd>Telescope lsp_references<CR>
nnoremap <leader>tf <cmd>Telescope lsp_document_symbols<CR>
nnoremap <leader>tF <cmd>Telescope lsp_workspace_symbols<CR>
nnoremap <leader>ra <cmd>Telescope code_actions theme=get_dropdown<CR>
vnoremap <leader>ra <cmd>Telescope range_code_actions theme=get_dropdown<CR>

" Git
nnoremap <leader>gl <cmd>Telescope git_commits<CR>
nnoremap <leader>gL <cmd>Telescope git_bcommits<CR>
nnoremap <leader>gc <cmd>Telescope git_branches<CR>

" Lists
nnoremap <leader>qq <cmd>Telescope quickfix<CR>
nnoremap <leader>ll <cmd>Telescope loclist<CR>

" Commandline
cnoremap <expr> he getcmdtype() ==# ':' && getcmdpos() == 1 ? 'Telescope help_tags<CR>' : 'he'
