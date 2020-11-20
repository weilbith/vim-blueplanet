let g:vista_sidebar_width = 35
let g:vista_echo_cursor_strategy = 'floating_win'
let g:vista_highlight_whole_line = 1
let g:vista_echo_cursor = 1
let g:vista_blink = [2, 500]
let g:vista_stay_on_open = 0
let g:vista_cursor_delay = 800

let g:vista_executive_for = {
      \ 'dockerfile': 'nvim_lsp',
      \ 'html': 'nvim_lsp',
      \ 'javascript': 'nvim_lsp',
      \ 'json': 'nvim_lsp',
      \ 'python': 'nvim_lsp',
      \ 'rust': 'nvim_lsp',
      \ 'terraform': 'nvim_lsp',
      \ 'latex': 'nvim_lsp',
      \ 'typescript': 'nvim_lsp',
      \ 'vim': 'nvim_lsp',
      \ 'vue': 'nvim_lsp',
      \ }


highlight! link VistaBracket     Grey
highlight! link VistaChildrenNr  Orange
highlight! link VistaScope       Red
highlight! link VistaTag         Green
highlight! link VistaPrefix      Grey
highlight! link VistaIcon        Blue
highlight! link VistaScopeKind   Yellow
highlight! link VistaColon       Grey
highlight! link VistaLineNr      Grey
highlight! link VistaHeadNr      White
highlight! link VistaPublic      Green
highlight! link VistaProtected   Yellow
highlight! link VistaPrivate     Red
