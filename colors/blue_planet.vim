"
" /$$$$$$$  /$$                           /$$$$$$$  /$$                                 /$$
"| $$__  $$| $$                          | $$__  $$| $$                                | $$
"| $$  \ $$| $$ /$$   /$$  /$$$$$$       | $$  \ $$| $$  /$$$$$$  /$$$$$$$   /$$$$$$  /$$$$$$
"| $$$$$$$ | $$| $$  | $$ /$$__  $$      | $$$$$$$/| $$ |____  $$| $$__  $$ /$$__  $$|_  $$_/
"| $$__  $$| $$| $$  | $$| $$$$$$$$      | $$____/ | $$  /$$$$$$$| $$  \ $$| $$$$$$$$  | $$
"| $$  \ $$| $$| $$  | $$| $$_____/      | $$      | $$ /$$__  $$| $$  | $$| $$_____/  | $$ /$$
"| $$$$$$$/| $$|  $$$$$$/|  $$$$$$$      | $$      | $$|  $$$$$$$| $$  | $$|  $$$$$$$  |  $$$$/
"|_______/ |__/ \______/  \_______/      |__/      |__/ \_______/|__/  |__/ \_______/   \___/
"
" Maintainer: Thore Weilbier (thore@weilbier.net)
"
" Based on Drew Hays 'adventurous' scheme, cause it basically fits my thoughts how it should look like.
" Is meant to use with the airline theme 'blue_planet', which base on this theme here. (of cause only when airline is installed)
"
" The theme require 256 colors for the terminal version or for Vim run in a " GUI.
"
" Why blue_planet u ask? Cause some day I start to customize all CLI tools and use with the same colors palette,
" which base on my awesome [wallpaper](http://wallpaper-gallery.net/images/wallpaper-hd-planet/wallpaper-hd-planet-22.jpg).
" Similar themes exist for i3, tmux, powerstatus10k, powerlevel9k, midnight commander, weechat, cmus, ...


hi clear

if exists('syntax_on')
    syntax reset
endif

set background=dark

let g:colors_name = 'blue_planet'

if &t_Co >= 256 || has('gui_running')
    highlight NormalActive   ctermbg=235 ctermfg=15 guibg=#262626 guifg=#FFFFFF cterm=NONE gui=NONE
    highlight NormalInactive ctermbg=234 ctermfg=15 guibg=#1c1c1c guifg=#FFFFFF cterm=NONE gui=NONE

    highlight Function      ctermbg=NONE ctermfg=32   guibg=NONE    guifg=#0087d7 cterm=NONE      gui=NONE
    highlight Comment       ctermbg=NONE ctermfg=247  guibg=NONE    guifg=#9e9e9e cterm=NONE      gui=italic
    highlight Constant      ctermbg=NONE ctermfg=24   guibg=NONE    guifg=#005f87 cterm=NONE      gui=NONE
    highlight Conditional   ctermbg=NONE ctermfg=214  guibg=NONE    guifg=#F5BB12 cterm=NONE      gui=NONE
    highlight Operator      ctermbg=NONE ctermfg=214  guibg=NONE    guifg=#F5BB12 cterm=NONE      gui=NONE
    highlight Error         ctermbg=NONE ctermfg=197  guibg=NONE    guifg=#ff005f cterm=reverse   gui=reverse
    highlight Identifier    ctermbg=NONE ctermfg=32   guibg=NONE    guifg=#5fd7ff cterm=NONE      gui=NONE
    highlight Ignore        ctermbg=NONE ctermfg=NONE guibg=NONE    guifg=NONE    cterm=NONE      gui=NONE
    highlight PreProc       ctermbg=NONE ctermfg=214  guibg=NONE    guifg=#F5BB12 cterm=NONE      gui=NONE
    highlight Special       ctermbg=NONE ctermfg=173  guibg=NONE    guifg=#DE935F cterm=NONE      gui=NONE
    highlight Statement     ctermbg=NONE ctermfg=81   guibg=NONE    guifg=#00afd7 cterm=NONE      gui=NONE
    highlight String        ctermbg=NONE ctermfg=191  guibg=NONE    guifg=#d7ff5f cterm=NONE      gui=NONE
    highlight Tag           ctermbg=NONE ctermfg=220  guibg=NONE    guifg=#FFC620 cterm=NONE      gui=NONE
    highlight Todo          ctermbg=NONE ctermfg=NONE guibg=NONE    guifg=NONE    cterm=reverse   gui=reverse
    highlight Type          ctermbg=NONE ctermfg=197  guibg=NONE    guifg=#ff005f cterm=none      gui=NONE
    highlight StorageClass  ctermbg=NONE ctermfg=220  guibg=NONE    guifg=#FFC620 cterm=none      gui=NONE
    highlight Underlined    ctermbg=NONE ctermfg=173  guibg=NONE    guifg=#DE935F cterm=underline gui=underline

    highlight LineNr        ctermbg=234  ctermfg=242  guibg=#1C1C1C guifg=#6C6C6C cterm=NONE      gui=NONE
    highlight NonText       ctermbg=NONE ctermfg=173  guibg=NONE    guifg=#DE935F cterm=bold      gui=bold
    highlight Whitespace    ctermbg=NONE ctermfg=173  guibg=NONE    guifg=#DE935F cterm=bold      gui=bold

    highlight Pmenu         ctermbg=24   ctermfg=15   guibg=#005f87 guifg=#ffffff cterm=NONE      gui=NONE
    highlight PmenuSbar     ctermbg=32   ctermfg=NONE guibg=#0087d7 guifg=NONE    cterm=NONE      gui=NONE
    highlight PmenuSel      ctermbg=81   ctermfg=235  guibg=#5fd7ff guifg=#262626 cterm=NONE      gui=NONE
    highlight PmenuThumb    ctermbg=81   ctermfg=NONE guibg=#5fd7ff guifg=NONE    cterm=NONE      gui=NONE

    highlight ErrorMsg      ctermbg=16   ctermfg=166  guibg=#191B1F guifg=#D3422E cterm=reverse   gui=reverse
    highlight ModeMsg       ctermbg=NONE ctermfg=70   guibg=NONE    guifg=#4BAE16 cterm=NONE      gui=NONE
    highlight MoreMsg       ctermbg=NONE ctermfg=109  guibg=NONE    guifg=#8ABEB7 cterm=NONE      gui=NONE
    highlight Question      ctermbg=NONE ctermfg=70   guibg=NONE    guifg=#4BAE16 cterm=NONE      gui=NONE
    highlight WarningMsg    ctermbg=NONE ctermfg=166  guibg=NONE    guifg=#D3422E cterm=NONE      gui=NONE

    highlight TabLineFill   ctermbg=NONE ctermfg=NONE guibg=#1B1D1E guifg=#1B1D1E cterm=NONE      gui=NONE
    highlight TabLine       ctermbg=NONE ctermfg=NONE guibg=#1B1D1E guifg=#808080 cterm=NONE      gui=NONE

    highlight Cursor        ctermbg=9    ctermfg=15   guibg=#000000 guifg=NONE    cterm=NONE      gui=NONE
    highlight CursorColumn  ctermbg=9    ctermfg=15   guibg=#FFFFFF guifg=NONE    cterm=NONE      gui=NONE
    highlight CursorLine    ctermbg=238  ctermfg=NONE guibg=#444444 guifg=NONE    cterm=NONE      gui=NONE
    highlight CursorLineNr  ctermbg=238  ctermfg=249  guibg=#444444 guifg=#B2B2B2 cterm=NONE      gui=NONE

    highlight helpLeadBlank ctermbg=NONE ctermfg=NONE guibg=NONE    guifg=NONE    cterm=NONE      gui=NONE
    highlight helpNormal    ctermbg=NONE ctermfg=NONE guibg=NONE    guifg=NONE    cterm=NONE      gui=NONE

    highlight StatusLine    ctermbg=152  ctermfg=32   guibg=#191B1F guifg=#277BD3 cterm=NONE      gui=NONE
    highlight StatusLineNC  ctermbg=32   ctermfg=152  guibg=#0087d7 guifg=#BFD7DB cterm=NONE      gui=NONE

    highlight Visual        ctermbg=222  ctermfg=16   guibg=#F0C674 guifg=#191B1F cterm=NONE      gui=NONE
    highlight VisualNOS     ctermbg=NONE ctermfg=NONE guibg=NONE    guifg=NONE    cterm=underline gui=underline

    highlight FoldColumn    ctermbg=234   ctermfg=81   guibg=#1c1c1c    guifg=#5fd7ff cterm=NONE      gui=NONE
    highlight Folded        ctermbg=NONE ctermfg=81   guibg=NONE    guifg=#5fd7ff cterm=NONE      gui=NONE

    highlight VertSplit     ctermbg=24   ctermfg=24   guibg=#005f87 guifg=#005f87 cterm=bold      gui=bold
    highlight WildMenu      ctermbg=24   ctermfg=15   guibg=#005f87 guifg=#FFFFFF cterm=NONE      gui=NONE

    highlight SpecialKey    ctermbg=NONE ctermfg=59   guibg=NONE    guifg=#404449 cterm=NONE      gui=NONE
    highlight Title         ctermbg=NONE ctermfg=32   guibg=NONE    guifg=#277BD3 cterm=bold      gui=bold

    highlight DiffAdd       ctermbg=191  ctermfg=16   guibg=#d7ff5f guifg=#000000 cterm=NONE      gui=NONE
    highlight DiffChange    ctermbg=222  ctermfg=16   guibg=#F0C676 guifg=#000000 cterm=NONE      gui=NONE
    highlight DiffDelete    ctermbg=197  ctermfg=15   guibg=#ff005f guifg=#ffffff cterm=NONE      gui=NONE
    highlight DiffText      ctermbg=222  ctermfg=197  guibg=#F0C676 guifg=#ff005f cterm=bold      gui=bold

    highlight IncSearch     ctermbg=214  ctermfg=16   guibg=#F5BB12 guifg=#191B1F cterm=NONE      gui=NONE
    highlight Search        ctermbg=222  ctermfg=16   guibg=#F0C674 guifg=#191B1F cterm=NONE      gui=NONE

    highlight Directory     ctermbg=NONE ctermfg=32   guibg=NONE    guifg=#0087d7 cterm=NONE      gui=NONE
    highlight MatchParen    ctermbg=NONE ctermfg=NONE guibg=NONE    guifg=NONE    cterm=underline gui=underline

    highlight SpellBad      ctermbg=NONE ctermfg=166  guibg=NONE    guifg=NONE    cterm=undercurl gui=undercurl guisp=#ff005f
    highlight SpellCap      ctermbg=NONE ctermfg=68   guibg=NONE    guifg=#3299CC cterm=undercurl gui=undercurl guisp=#3299CC
    highlight SpellLocal    ctermbg=NONE ctermfg=68   guibg=NONE    guifg=#3299CC cterm=undercurl gui=undercurl guisp=#3299CC
    highlight SpellRare     ctermbg=NONE ctermfg=109  guibg=NONE    guifg=#8ABEB7 cterm=undercurl gui=undercurl guisp=#8ABEB7

    highlight ColorColumn   ctermbg=16   ctermfg=NONE guibg=#24272D guifg=NONE    cterm=NONE      gui=NONE
    highlight SignColumn    ctermbg=234  ctermfg=242  guibg=#1C1C1C guifg=#6C6C6C cterm=NONE      gui=NONE

    "         Highlighting  for          results      in            preview       window(s).
    highlight previewWord   ctermbg=191  ctermfg=0    guibg=#d7ff5f guifg=#000000
    highlight previewLine   ctermbg=197  ctermfg=0    guibg=#ff005f guifg=#ffffff


elseif &t_Co == 8 || $TERM !~# '^linux' || &t_Co == 16
  " Not supported

endif


" Color Linking
highlight link Boolean             Number
highlight link Number              String
highlight link Character           Constant
highlight link Conceal             Constant
highlight link Debug               Special
highlight link Define              PreProc
highlight link Delimiter           Special
highlight link Exception           Statement
highlight link Float               Number
highlight link HelpCommand         Statement
highlight link HelpExample         Statement
highlight link Include             PreProc
highlight link Keyword             Statement
highlight link Label               Statement
highlight link Macro               PreProc
highlight link PreCondit           PreProc
highlight link Repeat              Statement
highlight link SpecialChar         Special
highlight link SpecialComment      Special
highlight link Structure           Type
highlight link Typedef             Type

highlight link htmlEndTag          htmlTagName
highlight link htmlLink            Function
highlight link htmlSpecialTagName  htmlTagName
highlight link htmlTag             htmlTagName
highlight link xmlTag              Statement
highlight link xmlTagName          Statement
highlight link xmlEndTag           Statement

highlight link diffBDiffer        WarningMsg
highlight link diffCommon         WarningMsg
highlight link diffDiffer         WarningMsg
highlight link diffIdentical      WarningMsg
highlight link diffIsA            WarningMsg
highlight link diffNoEOL          WarningMsg
highlight link diffOnly           WarningMsg
highlight link diffRemoved        WarningMsg
highlight link diffAdded          String

