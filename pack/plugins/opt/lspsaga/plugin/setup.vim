scriptencoding utf-8

lua require('lspsaga').init_lsp_saga({
      \   use_saga_diagnostic_sign = false,
      \   border_style = 3,
      \   code_action_icon = '',
      \   finder_definition_icon = '  ',
      \   finder_reference_icon = '  ',
      \   definition_preview_icon = '  ',
      \   dianostic_header_icon = '  ',
      \   rename_prompt_prefix = '➭ ',
      \   rename_prompt_prefix = '➭ ',
      \   code_action_keys = {
      \     quit = '<Esc>',
      \     exec = '<CR>',
      \   },
      \   rename_action_keys = {
      \     quit = '<Esc>',
      \     exec = '<CR>',
      \   },
      \   finder_action_keys = {
      \     quit = '<Esc>',
      \     open = '<CR>',
      \   },
      \   code_action_prompt = {
      \     enable = false,
      \   },
      \ })
