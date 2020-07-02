" Improved standard search commands (e.g. search visual selection)
map *   <Plug>(asterisk-*)
map #   <Plug>(asterisk-#)
map g*  <Plug>(asterisk-g*)
map g#  <Plug>(asterisk-g#)
map z*  <Plug>(asterisk-z*)
map gz* <Plug>(asterisk-gz*)
map z#  <Plug>(asterisk-z#)
map gz# <Plug>(asterisk-gz#)


if !exists('g:which_key_map') | let g:which_key_map = {} | endif
let g:which_key_map.s = { 'name': '+search' }

nnoremap <silent> <leader>ss <cmd>Denite grep<CR>
let g:which_key_map.s.s = 'recursive search in project directory (opens Denite filter)'

nnoremap <silent> <leader>sS <cmd>DeniteBufferDir grep<CR>
let g:which_key_map.s.s = 'recursive search in from current buffer directory (opens Denite filter)'

nnoremap <silent> <leader>sr <cmd>Denite -resume -cursor-pos=+1<CR>
let g:which_key_map.s.r = 'reload last Denite filter on next entry'

nnoremap <silent> <leader>sw <cmd>DeniteCursorWord grep<CR>
let g:which_key_map.s.w = 'recursive search for word under cursor in project directory (opens Denite filter)'

nnoremap <leader>sd :<C-u>Qargs<CR>argdo
let g:which_key_map.s.s = 'add quickfix entries to arglist and opens argdo'
