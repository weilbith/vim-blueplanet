if !exists('g:which_key_map') | let g:which_key_map = {} | endif
let g:which_key_map.s = { 'name': '+search' }


" Visual selection search with search-word keys.
xnoremap <silent> * <cmd>call utils#search#visual_selection_to_search_register()<CR>/<CR>
xnoremap <silent> # <cmd>call utils#search#visual_selection_to_search_register()<CR>?<CR>

nnoremap <leader>ss :Ack<Space>
let g:which_key_map.s.s = 'recursive search in project directory (populate to quickfix list)'

nnoremap <leader>sl :Lack<Space>
let g:which_key_map.s.l = 'recursive search in project directory (populate to location list)'

nnoremap <silent> <leader>sS :Denite grep<CR>
let g:which_key_map.s.S = 'recursive search in project directory (opens Denite filter)'

nnoremap <silent> <leader>sR :Denite grep -resume<CR>
let g:which_key_map.s.R = 'reload last search to Denite filter'

nnoremap <leader>sw :Ack -w <C-r><C-w><CR>
let g:which_key_map.s.w = 'recursive search for word under cursor in project directory'

nnoremap <leader>sd :Qargs<CR>:argdo
let g:which_key_map.s.s = 'add quickfix entries to arglist and opens argdo'
