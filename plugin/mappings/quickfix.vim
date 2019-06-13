if !exists('g:which_key_map') | let g:which_key_map = {} | endif
let g:which_key_map.q = { 'name': '+quickfix list' }


nnoremap <silent> <leader>qq :<C-u>call utils#quickfix#quickfix_jump()<CR>
let g:which_key_map.q.q = 'jump to quickfix window (jump back if already inside)'

nnoremap <silent> <leader>qc :<C-u>call utils#quickfix#quickfix_close(v:true)<CR>
let g:which_key_map.q.c = 'close quickfix window'

nnoremap <leader>q<CR> :cc<CR>
let g:which_key_map.q['<CR>'] = 'goto current selected quickfix list entry'

nnoremap <leader>qn :cnext<CR>
let g:which_key_map.q.n = 'next quickfix list entry'

nnoremap <leader>qN :cprevious<CR>
let g:which_key_map.q.N = 'previous quickfix list entry'

nnoremap <silent> <leader>qp :<C-u>call utils#quickfix#toggle_quickfix_preview()<CR>
let g:which_key_map.q.p = 'open current selected quickfix entry in horizontal preview window'

nnoremap <silent> <leader>qP :<C-u>call utils#quickfix#open_quickfix_preview_file()<CR>
let g:which_key_map.q.p = 'edit the current preview quickfix entry'

nnoremap <silent> <leader>qa :<C-u>:cnewer<CR>
let g:which_key_map.q.a = 'open next quickfix list'

nnoremap <silent> <leader>qb :<C-u>:colder<CR>
let g:which_key_map.q.b = 'open previous quickfix list'

nnoremap <silent> <leader>qh :<C-u>:chistory<CR>
let g:which_key_map.q.h = 'open quickfix list by history (opens selection window)'

nnoremap <silent> <leader>qs :<C-u>call utils#quickfix#store_current_list()<CR>
let g:which_key_map.q.s = 'store current quickfix list with a name'

nnoremap <silent> <leader>ql :<C-u>call utils#quickfix#restore_stored_list()<CR>
let g:which_key_map.q.l = 'reload saved quickfix list (opens selection window)'

nnoremap <silent> <leader>qL :<C-u>call utils#quickfix#delete_stored_list()<CR>
let g:which_key_map.q.L = 'delete saved quickfix list (opens selection window)'
