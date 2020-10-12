" Last edited text (useful for pasting).
onoremap <expr> il '<cmd>norm! `['.strpart(getregtype(), 0, 1).'`]<cr>'

" Selection
vnoremap <silent> af :<C-u>lua require'nvim-treesitter.textobjects.select'.select_textobject('@function.outer')<CR>
vnoremap <silent> if :<C-u>lua require'nvim-treesitter.textobjects.select'.select_textobject('@function.inner')<CR>

vnoremap <silent> ac :<C-u>lua require'nvim-treesitter.textobjects.select'.select_textobject('@class.outer')<CR>
vnoremap <silent> ic :<C-u>lua require'nvim-treesitter.textobjects.select'.select_textobject('@class.inner')<CR>

vnoremap <silent> ap :<C-u>lua require'nvim-treesitter.textobjects.select'.select_textobject('@parameter.outer')<CR>
vnoremap <silent> ip :<C-u>lua require'nvim-treesitter.textobjects.select'.select_textobject('@parameter.inner')<CR>


" Move
nnoremap <silent> ]f :<C-u>lua require'nvim-treesitter.textobjects.move'.goto_next_start("@function.outer")<CR>
onoremap <silent> ]f :<C-u>lua require'nvim-treesitter.textobjects.move'.goto_next_start("@function.outer")<CR>
nnoremap <silent> ]F :<C-u>lua require'nvim-treesitter.textobjects.move'.goto_next_end("@function.outer")<CR>
onoremap <silent> ]F :<C-u>lua require'nvim-treesitter.textobjects.move'.goto_next_end("@function.outer")<CR>
nnoremap <silent> [f :<C-u>lua require'nvim-treesitter.textobjects.move'.goto_previous_start("@function.outer")<CR>
onoremap <silent> [f :<C-u>lua require'nvim-treesitter.textobjects.move'.goto_previous_start("@function.outer")<CR>
nnoremap <silent> [F :<C-u>lua require'nvim-treesitter.textobjects.move'.goto_previous_end("@function.outer")<CR>
onoremap <silent> [F :<C-u>lua require'nvim-treesitter.textobjects.move'.goto_previous_end("@function.outer")<CR>

nnoremap <silent> ]c :<C-u>lua require'nvim-treesitter.textobjects.move'.goto_next_start("@class.outer")<CR>
onoremap <silent> ]c :<C-u>lua require'nvim-treesitter.textobjects.move'.goto_next_start("@class.outer")<CR>
nnoremap <silent> ]C :<C-u>lua require'nvim-treesitter.textobjects.move'.goto_next_end("@class.outer")<CR>
onoremap <silent> ]C :<C-u>lua require'nvim-treesitter.textobjects.move'.goto_next_end("@class.outer")<CR>
nnoremap <silent> [c :<C-u>lua require'nvim-treesitter.textobjects.move'.goto_previous_start("@class.outer")<CR>
onoremap <silent> [c :<C-u>lua require'nvim-treesitter.textobjects.move'.goto_previous_start("@class.outer")<CR>
nnoremap <silent> [C :<C-u>lua require'nvim-treesitter.textobjects.move'.goto_previous_end("@class.outer")<CR>
onoremap <silent> [C :<C-u>lua require'nvim-treesitter.textobjects.move'.goto_previous_end("@class.outer")<CR>
