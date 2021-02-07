inoremap <silent> <expr> <C-e>     compe#close('<C-e>')
inoremap <silent> <expr> <CR>      compe#confirm({ 'keys': "\<Plug>delimitMateCR", 'mode': '' })
