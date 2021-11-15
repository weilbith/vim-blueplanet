scriptencoding utf-8

let g:nvim_tree_indent_markers = 1
let g:nvim_tree_git_hl = 1
let g:nvim_tree_show_icons = {
      \   'git': 0,
      \   'folders': 1,
      \   'icons': 1
      \ }

let g:nvim_tree_ignore = [
      \   '.git',
      \   'node_modules',
      \   '*.aux',
      \   '*bbl',
      \   '*.blg',
      \   '*.dvi',
      \   '*.fls',
      \   '*.out',
      \   '*.log',
      \   '*.fdb_latexmk',
      \   '*.pdf',
      \   '*.tern-port',
      \   '__pycache__',
      \   '.mypy_cache',
      \   '.pytest_cache',
      \   '.egg-info'
      \ ]


if exists('g:indentLine_fileTypeExclude') | call add(g:indentLine_fileTypeExclude, 'NvimTree') | endif

lua require('nvim-tree').setup()
