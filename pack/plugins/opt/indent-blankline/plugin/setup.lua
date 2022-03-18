vim.g.indent_blankline_char = '│'
vim.g.indent_blankline_space_char = ' '
vim.g.indent_blankline_show_current_context = true
vim.g.indent_blankline_show_first_indent_level = false
vim.g.indent_blankline_use_treesitter = true
vim.g.indent_blankline_filetype_exclude = { 'help', 'packer', 'code-action-menu-details' }
vim.g.indent_blankline_context_patterns = {
  'class',
  'function',
  'method',
  '^if',
  'while',
  'for',
  'with',
  'func_literal',
  'block',
  'try',
  'except',
  'argument_list',
  'object',
  'dictionary',
}
