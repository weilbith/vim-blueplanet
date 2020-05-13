let g:completion_enable_auto_popup = 1
let g:completion_enable_auto_hover = 1
let g:completion_enable_auto_signature = 1
let g:completion_enable_snippet = 'UltiSnips'
let g:completion_confirm_key = '' " This just always overwrite any <CR> mapping else (Denite issues)
let g:completion_confirm_key_rhs = "\<Plug>delimitMateCR"
let g:completion_chain_complete_list = [{'complete_items': ['lsp', 'snippet']} ]
" let g:completion_chain_complete_list = [{'complete_items': ['lsp', 'snippet', 'path']} ]
