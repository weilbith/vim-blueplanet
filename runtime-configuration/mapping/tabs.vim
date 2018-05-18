" Open empty new tab.
nnoremap <leader>To :tabedit<CR>

" Open new tab with active buffer in it.
nnoremap <leader>Te :tabedit %<CR>

" Move between tabs by using a submode (require submode plugin).
call submode#enter_with('switchTabs', 'n', '', '<space>Tn', ':tabnext<cr>')
call submode#enter_with('switchTabs', 'n', '', '<space>Tp', ':tabprevious<cr>')
call submode#map('switchTabs', 'n', '', 'n', ':tabnext<cr>')
call submode#map('switchTabs', 'n', '', 'n', ':tabprevious<cr>')

" Close current tab and close all visible buffers in it.
nnoremap <leader>Tc :windo bd!<bar>tabclose<CR>
