scriptencoding utf-8

let g:lua_tree_indent_markers = 1
let g:lua_tree_git_hl = 1
let g:lua_tree_icons = {
    \ 'git': {
    \   'unstaged': '✗',
    \   'staged': '',
    \   'unmerged': '',
    \   'renamed': '➜',
    \   'untracked': ''
    \   },
    \ }

let g:lua_tree_ignore = [
      \ '.git',
      \ 'node_modules',
      \ '*.aux',
      \ '*bbl',
      \ '*.blg',
      \ '*.dvi',
      \ '*.fls',
      \ '*.out',
      \ '*.log',
      \ '*.fdb_latexmk',
      \ '*.pdf',
      \ '*.tern-port',
      \ '__pycache__',
      \ '.mypy_cache',
      \ '.pytest_cache',
      \ '.egg-info'
      \ ]


highlight! link LuaTreeRootFolder   BlueUnderline
highlight! link LuaTreeFolderName   BlueBold
highlight! link LuaTreeFolderIcon   BlueBold
highlight! link LuaTreeIndentMarker Blue
highlight! link LuaTreeSymlink      GreenItalic
highlight! link LuaTreeExecFile     OrangeItalic
highlight! link LuaTreeSpecialFile  YellowItalic
highlight! link LuaTreeImageFile    PurpleItalic
highlight! link LuaTreeMarkdownFile OrgangeItalic
