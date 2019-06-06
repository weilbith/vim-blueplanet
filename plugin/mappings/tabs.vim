" Open empty new tab.
nnoremap <leader>To :tabedit<CR>

" Open new tab with active buffer in it.
nnoremap <leader>Te :tabedit %<CR>
nnoremap <leader>TE :tab split<CR>

" Move between tabs by using a submode (require submode plugin).
call submode#enter_with('TabSwitch', 'n', '', '<space>Tn', ':tabnext<cr>')
call submode#enter_with('TabSwitch', 'n', '', '<space>Tp', ':tabprevious<cr>')
call submode#map('TabSwitch', 'n', '', 'n', ':tabnext<cr>')
call submode#map('TabSwitch', 'n', '', 'n', ':tabprevious<cr>')

" Close current tab and close all visible buffers in it.
nnoremap <leader>Tc :windo bd!<bar>tabclose<CR>

" Rename current tab.
nnoremap <silent> <leader>Tr :<C-u>call utils#tabs#set_name()<CR>
