" Selection
" For some reason the prefered <cmd> mappings do not work here. Issue is open.
onoremap <silent> am :<C-u>TSTextobjectSelect @function.outer<CR>
vnoremap <silent> am :<C-u>TSTextobjectSelect @function.outer<CR>
onoremap <silent> im :<C-u>TSTextobjectSelect @function.inner<CR>
vnoremap <silent> im :<C-u>TSTextobjectSelect @function.inner<CR>

onoremap <silent> ac :<C-u>TSTextobjectSelect @class.outer<CR>
vnoremap <silent> ac :<C-u>TSTextobjectSelect @class.outer<CR>
onoremap <silent> ic :<C-u>TSTextobjectSelect @class.inner<CR>
vnoremap <silent> ic :<C-u>TSTextobjectSelect @class.inner<CR>

" 'a' for 'argument' instead of 'p' that is associated with paragraph per default
onoremap <silent> aa :<C-u>TSTextobjectSelect @parameter.outer<CR>
vnoremap <silent> aa :<C-u>TSTextobjectSelect @parameter.outer<CR>
onoremap <silent> ia :<C-u>TSTextobjectSelect @parameter.inner<CR>
vnoremap <silent> ia :<C-u>TSTextobjectSelect @parameter.inner<CR>

onoremap <silent> a/ :<C-u>TSTextobjectSelect @comment.outer<CR>
vnoremap <silent> a/ :<C-u>TSTextobjectSelect @comment.outer<CR>
onoremap <silent> i/ :<C-u>TSTextobjectSelect @comment.outer<CR>
vnoremap <silent> i/ :<C-u>TSTextobjectSelect @comment.outer<CR>


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
