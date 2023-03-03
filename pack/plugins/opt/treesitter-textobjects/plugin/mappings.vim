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
nnoremap ]m <cmd>TSTextobjectGotoNextStart @function.outer<CR>
onoremap ]m <cmd>TSTextobjectGotoNextStart @function.outer<CR>
vnoremap ]m <cmd>TSTextobjectGotoNextStart @function.outer<CR>
nnoremap ]M <cmd>TSTextobjectGotoNextEnd @function.outer<CR>
onoremap ]M <cmd>TSTextobjectGotoNextEnd @function.outer<CR>
vnoremap ]M <cmd>TSTextobjectGotoNextEnd @function.outer<CR>
nnoremap [m <cmd>TSTextobjectGotoPreviousStart @function.outer<CR>
onoremap [m <cmd>TSTextobjectGotoPreviousStart @function.outer<CR>
vnoremap [m <cmd>TSTextobjectGotoPreviousStart @function.outer<CR>
nnoremap [M <cmd>TSTextobjectGotoPreviousEnd @function.outer<CR>
onoremap [M <cmd>TSTextobjectGotoPreviousEnd @function.outer<CR>
vnoremap [M <cmd>TSTextobjectGotoPreviousEnd @function.outer<CR>

nnoremap ]c <cmd>TSTextobjectGotoNextStart @class.outer<CR>
onoremap ]c <cmd>TSTextobjectGotoNextStart @class.outer<CR>
vnoremap ]c <cmd>TSTextobjectGotoNextStart @class.outer<CR>
nnoremap ]C <cmd>TSTextobjectGotoNextEnd @class.outer<CR>
onoremap ]C <cmd>TSTextobjectGotoNextEnd @class.outer<CR>
vnoremap ]C <cmd>TSTextobjectGotoNextEnd @class.outer<CR>
nnoremap [c <cmd>TSTextobjectGotoPreviousStart @class.outer<CR>
onoremap [c <cmd>TSTextobjectGotoPreviousStart @class.outer<CR>
vnoremap [c <cmd>TSTextobjectGotoPreviousStart @class.outer<CR>
nnoremap [C <cmd>TSTextobjectGotoPreviousEnd @class.outer<CR>
onoremap [C <cmd>TSTextobjectGotoPreviousEnd @class.outer<CR>
vnoremap [C <cmd>TSTextobjectGotoPreviousEnd @class.outer<CR>

nnoremap ]a <cmd>TSTextobjectGotoNextStart @parameter.outer<CR>
onoremap ]a <cmd>TSTextobjectGotoNextStart @parameter.outer<CR>
vnoremap ]a <cmd>TSTextobjectGotoNextStart @parameter.outer<CR>
nnoremap ]A <cmd>TSTextobjectGotoNextEnd @parameter.outer<CR>
onoremap ]A <cmd>TSTextobjectGotoNextEnd @parameter.outer<CR>
vnoremap ]A <cmd>TSTextobjectGotoNextEnd @parameter.outer<CR>
nnoremap [a <cmd>TSTextobjectGotoPreviousStart @parameter.outer<CR>
onoremap [a <cmd>TSTextobjectGotoPreviousStart @parameter.outer<CR>
vnoremap [a <cmd>TSTextobjectGotoPreviousStart @parameter.outer<CR>
nnoremap [A <cmd>TSTextobjectGotoPreviousEnd @parameter.outer<CR>
onoremap [A <cmd>TSTextobjectGotoPreviousEnd @parameter.outer<CR>
vnoremap [A <cmd>TSTextobjectGotoPreviousEnd @parameter.outer<CR>

nnoremap ]/ :<c-u>TSTextobjectGotoNextStart @comment.outer<cr>
onoremap ]/ :<c-u>TSTextobjectGotonextStart @comment.outer<cr>
vnoremap ]/ :<c-u>TSTextobjectGotonextStart @comment.outer<cr>
nnoremap [/ :<c-u>TSTextobjectGotoPreviousStart @comment.outer<cr>
onoremap [/ :<c-u>TSTextobjectGotoPreviousStart @comment.outer<cr>
vnoremap [/ :<c-u>TSTextobjectGotoPreviousStart @comment.outer<cr>
