" Relies mostly on mappings in the package 'abstractions > snippets'

inoremap <C-c>  <cmd>lua require('luasnip').change_choice(1)<CR>
snoremap <C-c>  <cmd>lua require('luasnip').change_choice(1)<CR>

" xnoremap c      :lua require('luasnip.util.util').store_selection()<CR>gv"_s
" xnoremap d      dgv:lua require('luasnip.util.util').store_selection()<CR>

" Allow to type the character `p` and do not use the paste action.
snoremap p      p
