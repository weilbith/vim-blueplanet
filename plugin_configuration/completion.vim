let g:completion_enable_auto_popup = 1
let g:completion_enable_auto_hover = 1
let g:completion_enable_auto_signature = 1
let g:completion_enable_auto_paren = 1
let g:completion_enable_snippet = 'UltiSnips'
let g:completion_auto_change_source = 1
let g:completion_confirm_key = ''
let g:completion_trigger_on_delete = 1
let g:completion_matching_strategy_list = ['fuzzy', 'exact']
let g:completion_chain_complete_list = {
      \   'default': {
      \     'default': [
      \         {'complete_items': ['snippet', 'lsp', 'path']},
      \     ],
      \     'func': [
      \         {'complete_items': ['lsp']},
      \     ],
      \     'comment': [
      \         {'mode': '<c-k>'},
      \     ],
      \   },
      \   'denite-filter': {
      \     'default': []
      \   }
      \ }
