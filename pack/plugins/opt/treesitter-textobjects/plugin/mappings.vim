" Peek Definition
nnoremap gK <cmd>TSTextobjectPeekDefinitionCode @function.outer<CR>


" Selection
onoremap <silent> af <cmd>TSTextobjectSelect @function.outer<CR>
vnoremap <silent> af <cmd>TSTextobjectSelect @function.outer<CR>
onoremap <silent> if <cmd>TSTextobjectSelect @function.inner<CR>
vnoremap <silent> if <cmd>TSTextobjectSelect @function.inner<CR>

onoremap <silent> ac <cmd>TSTextobjectSelect @class.outer<CR>
vnoremap <silent> ac <cmd>TSTextobjectSelect @class.outer<CR>
onoremap <silent> ic <cmd>TSTextobjectSelect @class.inner<CR>
vnoremap <silent> ic <cmd>TSTextobjectSelect @class.inner<CR>

" 'a' for 'argument' instead of 'p' that is associated with paragraph per default
onoremap <silent> aa <cmd>TSTextobjectSelect @parameter.outer<CR>
vnoremap <silent> aa <cmd>TSTextobjectSelect @parameter.outer<CR>
onoremap <silent> ia <cmd>TSTextobjectSelect @parameter.inner<CR>
vnoremap <silent> ia <cmd>TSTextobjectSelect @parameter.inner<CR>

" '/' since many languages use '//' as comment prefix and 'c' is used for 'class'
onoremap <silent> a/ <cmd>TSTextobjectSelect @comment.outer<CR>
vnoremap <silent> a/ <cmd>TSTextobjectSelect @comment.outer<CR>
onoremap <silent> i/ <cmd>TSTextobjectSelect @comment.outer<CR>
vnoremap <silent> i/ <cmd>TSTextobjectSelect @comment.outer<CR>


" Move
nnoremap <silent> ]f <cmd>TSTextobjectGotoNextStart @function.outer<CR>
onoremap <silent> ]f <cmd>TSTextobjectGotoNextStart @function.outer<CR>
nnoremap <silent> ]F <cmd>TSTextobjectGotoNextEnd @function.outer<CR>
onoremap <silent> ]F <cmd>TSTextobjectGotoNextEnd @function.outer<CR>
nnoremap <silent> [f <cmd>TSTextobjectGotoPreviousStart @function.outer<CR>
onoremap <silent> [f <cmd>TSTextobjectGotoPreviousStart @function.outer<CR>
nnoremap <silent> [F <cmd>TSTextobjectGotoPreviousEnd @function.outer<CR>
onoremap <silent> [F <cmd>TSTextobjectGotoPreviousEnd @function.outer<CR>

nnoremap <silent> ]c <cmd>TSTextobjectGotoNextStart @class.outer<CR>
onoremap <silent> ]c <cmd>TSTextobjectGotoNextStart @class.outer<CR>
nnoremap <silent> ]C <cmd>TSTextobjectGotoNextEnd @class.outer<CR>
onoremap <silent> ]C <cmd>TSTextobjectGotoNextEnd @class.outer<CR>
nnoremap <silent> [c <cmd>TSTextobjectGotoPreviousStart @class.outer<CR>
onoremap <silent> [c <cmd>TSTextobjectGotoPreviousStart @class.outer<CR>
nnoremap <silent> [C <cmd>TSTextobjectGotoPreviousEnd @class.outer<CR>
onoremap <silent> [C <cmd>TSTextobjectGotoPreviousEnd @class.outer<CR>

nnoremap <silent> ]a <cmd>TSTextobjectGotoNextStart @parameter.outer<CR>
onoremap <silent> ]a <cmd>TSTextobjectGotoNextStart @parameter.outer<CR>
nnoremap <silent> ]A <cmd>TSTextobjectGotoNextEnd @parameter.outer<CR>
onoremap <silent> ]A <cmd>TSTextobjectGotoNextEnd @parameter.outer<CR>
nnoremap <silent> [a <cmd>TSTextobjectGotoPreviousStart @parameter.outer<CR>
onoremap <silent> [a <cmd>TSTextobjectGotoPreviousStart @parameter.outer<CR>
nnoremap <silent> [A <cmd>TSTextobjectGotoPreviousEnd @parameter.outer<CR>
onoremap <silent> [A <cmd>TSTextobjectGotoPreviousEnd @parameter.outer<CR>

nnoremap <silent> ]/ :<c-u>tstextobjectgotonextstart @comment.outer<cr>
onoremap <silent> ]/ :<c-u>tstextobjectgotonextstart @comment.outer<cr>
nnoremap <silent> [/ :<c-u>tstextobjectgotopreviousstart @comment.outer<cr>
onoremap <silent> [/ :<c-u>tstextobjectgotopreviousstart @comment.outer<cr>
