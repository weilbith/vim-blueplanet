scriptencoding utf-8

let g:NERDTreeShowHidden = 1
let g:NERDTreeWindowSize = 30
let g:NERDTreeHighlightCursorline = 1
let g:NERDTreeWinPos = 'left'
let g:NERDTreeChDirMode = 2
let g:NERDTreeShowBookmarks = 1
let g:NERDTreeDirArrowExpandable = ''
let g:NERDTreeDirArrowCollapsible = ''
let g:NERDTreeBookmarksFile = $XDG_DATA_HOME . '/nvim/NERDTreeBookmarks'
let g:NERDTreeIgnore = ['\.git$[[dir]]', '\.aux$[[file]]', '\.bbl$[[file]]', '\.blg$[[file]]', '\.dvi$[[file]]',
      \ '\.fls$[[file]]', '\.out$[[file]]', '\.log$[[file]]', '\.fdb_latexmk$[[file]]', '\.pdf$[[file]]', '\.tern-port$[[file]]', '__pycache__$[[dir]]',
      \ '\.mypy_cache$[[dir]]', '\.pytest_cache$[[dir]]', '\.egg-info$[[dir]]' ]

highlight! link NERDTreeDir         Green
highlight! link NERDTreeDirSlash    Green
highlight! link NERDTreeOpenable    Blue
highlight! link NERDTreeClosable    Blue
highlight! link NERDTreeFile        White
highlight! link NERDTreeExecFile    Red
highlight! link NERDTreeUp          Grey
highlight! link NERDTreeCWD         Purple
highlight! link NERDTreeHelp        Grey
highlight! link NERDTreeToggleOn    Green
highlight! link NERDTreeToggleOff   Red
highlight! link NERDTreeFlags       Blue
highlight! link NERDTreeLinkFile    Grey
highlight! link NERDTreeLinkTarget  Green
