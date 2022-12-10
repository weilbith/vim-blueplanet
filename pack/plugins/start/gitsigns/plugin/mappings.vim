nnoremap <leader>gm <cmd>Gitsigns blame_line { full = true }<CR>
nnoremap <leader>ghh <cmd>Gitsigns preview_hunk_inline<CR>

nnoremap <leader>ghs <cmd>Gitsigns stage_hunk<CR>
vnoremap <leader>gs :Gitsigns stage_hunk<CR>
nnoremap <leader>gS <cmd>Gitsigns stage_buffer<CR>

nnoremap <leader>ghr <cmd>Gitsigns reset_hunk<CR>
nnoremap <leader>gR <cmd>Gitsigns reset_buffer<CR>

nnoremap <silent> <expr> ]h &diff ? ']c' : ":\<C-u>Gitsigns next_hunk\<CR>"
nnoremap <silent> <expr> [h &diff ? '[c' : ":\<C-u>Gitsigns prev_hunk\<CR>"

onoremap ih <cmd>Gitsigns select_hunk<CR>
onoremap ah <cmd>Gitsigns select_hunk<CR>
xnoremap ih <cmd>Gitsigns select_hunk<CR>
xnoremap ah <cmd>Gitsigns select_hunk<CR>
