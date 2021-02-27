" Selection
onoremap <silent> am <cmd>TSTextobjectSelect @function.outer<CR>
vnoremap <silent> am <cmd>TSTextobjectSelect @function.outer<CR>
onoremap <silent> im <cmd>TSTextobjectSelect @function.inner<CR>
vnoremap <silent> im <cmd>TSTextobjectSelect @function.inner<CR>

onoremap <silent> ac <cmd>TSTextobjectSelect @class.outer<CR>
vnoremap <silent> ac <cmd>TSTextobjectSelect @class.outer<CR>
onoremap <silent> ic <cmd>TSTextobjectSelect @class.inner<CR>
vnoremap <silent> ic <cmd>TSTextobjectSelect @class.inner<CR>

" 'a' for 'argument' instead of 'p' that is associated with paragraph per default
onoremap <silent> aa <cmd>TSTextobjectSelect @parameter.outer<CR>
vnoremap <silent> aa <cmd>TSTextobjectSelect @parameter.outer<CR>
onoremap <silent> ia <cmd>TSTextobjectSelect @parameter.inner<CR>
vnoremap <silent> ia <cmd>TSTextobjectSelect @parameter.inner<CR>

onoremap <silent> a/ <cmd>TSTextobjectSelect @comment.outer<CR>
vnoremap <silent> a/ <cmd>TSTextobjectSelect @comment.outer<CR>
onoremap <silent> i/ <cmd>TSTextobjectSelect @comment.outer<CR>
vnoremap <silent> i/ <cmd>TSTextobjectSelect @comment.outer<CR>


" Move
nnoremap <silent> ]m <cmd>TSTextobjectGotoNextStart @function.outer<CR>
onoremap <silent> ]m <cmd>TSTextobjectGotoNextStart @function.outer<CR>
vnoremap <silent> ]m <cmd>TSTextobjectGotoNextStart @function.outer<CR>
nnoremap <silent> ]M <cmd>TSTextobjectGotoNextEnd @function.outer<CR>
onoremap <silent> ]M <cmd>TSTextobjectGotoNextEnd @function.outer<CR>
vnoremap <silent> ]M <cmd>TSTextobjectGotoNextEnd @function.outer<CR>
nnoremap <silent> [m <cmd>TSTextobjectGotoPreviousStart @function.outer<CR>
onoremap <silent> [m <cmd>TSTextobjectGotoPreviousStart @function.outer<CR>
vnoremap <silent> [m <cmd>TSTextobjectGotoPreviousStart @function.outer<CR>
nnoremap <silent> [M <cmd>TSTextobjectGotoPreviousEnd @function.outer<CR>
onoremap <silent> [M <cmd>TSTextobjectGotoPreviousEnd @function.outer<CR>
vnoremap <silent> [M <cmd>TSTextobjectGotoPreviousEnd @function.outer<CR>

nnoremap <silent> ]c <cmd>TSTextobjectGotoNextStart @class.outer<CR>
onoremap <silent> ]c <cmd>TSTextobjectGotoNextStart @class.outer<CR>
vnoremap <silent> ]c <cmd>TSTextobjectGotoNextStart @class.outer<CR>
nnoremap <silent> ]C <cmd>TSTextobjectGotoNextEnd @class.outer<CR>
onoremap <silent> ]C <cmd>TSTextobjectGotoNextEnd @class.outer<CR>
vnoremap <silent> ]C <cmd>TSTextobjectGotoNextEnd @class.outer<CR>
nnoremap <silent> [c <cmd>TSTextobjectGotoPreviousStart @class.outer<CR>
onoremap <silent> [c <cmd>TSTextobjectGotoPreviousStart @class.outer<CR>
vnoremap <silent> [c <cmd>TSTextobjectGotoPreviousStart @class.outer<CR>
nnoremap <silent> [C <cmd>TSTextobjectGotoPreviousEnd @class.outer<CR>
onoremap <silent> [C <cmd>TSTextobjectGotoPreviousEnd @class.outer<CR>
vnoremap <silent> [C <cmd>TSTextobjectGotoPreviousEnd @class.outer<CR>

nnoremap <silent> ]a <cmd>TSTextobjectGotoNextStart @parameter.outer<CR>
onoremap <silent> ]a <cmd>TSTextobjectGotoNextStart @parameter.outer<CR>
vnoremap <silent> ]a <cmd>TSTextobjectGotoNextStart @parameter.outer<CR>
nnoremap <silent> ]A <cmd>TSTextobjectGotoNextEnd @parameter.outer<CR>
onoremap <silent> ]A <cmd>TSTextobjectGotoNextEnd @parameter.outer<CR>
vnoremap <silent> ]A <cmd>TSTextobjectGotoNextEnd @parameter.outer<CR>
nnoremap <silent> [a <cmd>TSTextobjectGotoPreviousStart @parameter.outer<CR>
onoremap <silent> [a <cmd>TSTextobjectGotoPreviousStart @parameter.outer<CR>
vnoremap <silent> [a <cmd>TSTextobjectGotoPreviousStart @parameter.outer<CR>
nnoremap <silent> [A <cmd>TSTextobjectGotoPreviousEnd @parameter.outer<CR>
onoremap <silent> [A <cmd>TSTextobjectGotoPreviousEnd @parameter.outer<CR>
vnoremap <silent> [A <cmd>TSTextobjectGotoPreviousEnd @parameter.outer<CR>

nnoremap <silent> ]/ :<c-u>TSTextobjectGotoNextStart @comment.outer<cr>
onoremap <silent> ]/ :<c-u>TSTextobjectGotonextStart @comment.outer<cr>
vnoremap <silent> ]/ :<c-u>TSTextobjectGotonextStart @comment.outer<cr>
nnoremap <silent> [/ :<c-u>TSTextobjectGotoPreviousStart @comment.outer<cr>
onoremap <silent> [/ :<c-u>TSTextobjectGotoPreviousStart @comment.outer<cr>
vnoremap <silent> [/ :<c-u>TSTextobjectGotoPreviousStart @comment.outer<cr>
