if !exists('g:which_key_map') | let g:which_key_map = {} | endif
let g:which_key_map.q = { 'name': '+quickfix list' }


nnoremap <silent> <leader>qq <cmd>call utils#quickfix#quickfix_jump()<CR>
let g:which_key_map.q.q = 'jump to quickfix window (jump back if already inside)'

nnoremap <silent> <leader>qc <cmd>cclose<CR>
let g:which_key_map.q.c = 'close quickfix window'

nnoremap <leader>q<CR> <cmd>cc<CR>
let g:which_key_map.q['<CR>'] = 'goto current selected quickfix list entry'

nnoremap <leader>qn <cmd>cnext<CR>
let g:which_key_map.q.n = 'next quickfix list entry'

nnoremap <leader>qN <cmd>cprevious<CR>
let g:which_key_map.q.N = 'previous quickfix list entry'

nnoremap <leader>qf <cmd>Denite quickfix_list<CR>
let g:which_key_map.q.f = 'filter current quickfix list with Denite'

nnoremap <silent> <leader>qa <cmd>cnewer<CR>
let g:which_key_map.q.a = 'open next quickfix list'

nnoremap <silent> <leader>qb <cmd>colder<CR>
let g:which_key_map.q.b = 'open previous quickfix list'

nnoremap <silent> <leader>qh <cmd>chistory<CR>
let g:which_key_map.q.h = 'open quickfix list by history (opens selection window)'

nnoremap <silent> <leader>qs <cmd>QuicknameSave<CR>
let g:which_key_map.q.s = 'store current quickfix list with a name'

nnoremap <silent> <leader>ql <cmd>QuicknameLoad<CR>
let g:which_key_map.q.l = 'reload saved quickfix list (opens selection window)'

nnoremap <silent> <leader>qr <cmd>QuicknameRemove<CR>
let g:which_key_map.q.r = 'remove saved quickfix list (opens selection window)'
