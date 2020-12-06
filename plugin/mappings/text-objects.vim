" Last edited text (useful for pasting).
onoremap <expr> il '<cmd>norm! `['.strpart(getregtype(), 0, 1).'`]<cr>'

" Selection
vnoremap <silent> af :<C-u>TSTextobjectSelect @function.outer<CR>
vnoremap <silent> if :<C-u>TSTextobjectSelect @function.inner<CR>

vnoremap <silent> ac :<C-u>TSTextobjectSelect @class.outer<CR>
vnoremap <silent> ic :<C-u>TSTextobjectSelect @class.inner<CR>

vnoremap <silent> ap :<C-u>TSTextobjectSelect @parameter.outer<CR>
vnoremap <silent> ip :<C-u>TSTextobjectSelect @parameter.inner<CR>

vnoremap <silent> a/ :<C-u>TSTextobjectSelect @comment.outer<CR>
vnoremap <silent> i/ :<C-u>TSTextobjectSelect @comment.outer<CR>


" Move
nnoremap <silent> ]f :<C-u>TSTextobjectGotoNextStart @function.outer<CR>
onoremap <silent> ]f :<C-u>TSTextobjectGotoNextStart @function.outer<CR>
nnoremap <silent> ]F :<C-u>TSTextobjectGotoNextEnd @function.outer<CR>
onoremap <silent> ]F :<C-u>TSTextobjectGotoNextEnd @function.outer<CR>
nnoremap <silent> [f :<C-u>TSTextobjectGotoPreviousStart @function.outer<CR>
onoremap <silent> [f :<C-u>TSTextobjectGotoPreviousStart @function.outer<CR>
nnoremap <silent> [F :<C-u>TSTextobjectGotoPreviousEnd @function.outer<CR>
onoremap <silent> [F :<C-u>TSTextobjectGotoPreviousEnd @function.outer<CR>

nnoremap <silent> ]c :<C-u>TSTextobjectGotoNextStart @class.outer<CR>
onoremap <silent> ]c :<C-u>TSTextobjectGotoNextStart @class.outer<CR>
nnoremap <silent> ]C :<C-u>TSTextobjectGotoNextEnd @class.outer<CR>
onoremap <silent> ]C :<C-u>TSTextobjectGotoNextEnd @class.outer<CR>
nnoremap <silent> [c :<C-u>TSTextobjectGotoPreviousStart @class.outer<CR>
onoremap <silent> [c :<C-u>TSTextobjectGotoPreviousStart @class.outer<CR>
nnoremap <silent> [C :<C-u>TSTextobjectGotoPreviousEnd @class.outer<CR>
onoremap <silent> [C :<C-u>TSTextobjectGotoPreviousEnd @class.outer<CR>
