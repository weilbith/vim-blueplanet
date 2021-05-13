let g:indent_blankline_char = '│'
let g:indent_blankline_space_char = ' '
let g:indent_blankline_show_current_context = v:true
let g:indent_blankline_show_first_indent_level = v:false
let g:indent_blankline_use_treesitter = v:true
let g:indent_blankline_filetype_exclude = ['help']
let g:indent_blankline_context_patterns = [
      \   'class',
      \   'function',
      \   'method',
      \   '^if',
      \   'while',
      \   'for',
      \   'with',
      \   'func_literal',
      \   'block',
      \   'try',
      \   'except',
      \   'argument_list',
      \   'object',
      \   'dictionary'
      \ ]
