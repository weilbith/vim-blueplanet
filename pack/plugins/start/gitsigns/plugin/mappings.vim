nnoremap <leader>gh <cmd>Gitsigns preview_hunk<CR>
nnoremap <leader>gH <cmd>Gitsigns stage_hunk<CR>
vnoremap <leader>gH :Gitsigns stage_hunk<CR>
nnoremap <leader>gm <cmd>Gitsigns blame_line { full = true }<CR>

nnoremap <silent> <expr> ]h &diff ? ']c' : ":\<C-u>Gitsigns next_hunk\<CR>"
nnoremap <silent> <expr> [h &diff ? '[c' : ":\<C-u>Gitsigns prev_hunk\<CR>"

onoremap ih <cmd>Gitsigns select_hunk<CR>
onoremap ah <cmd>Gitsigns select_hunk<CR>
xnoremap ih <cmd>Gitsigns select_hunk<CR>
xnoremap ah <cmd>Gitsigns select_hunk<CR>
