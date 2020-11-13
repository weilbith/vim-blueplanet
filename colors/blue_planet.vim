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
" Based on Drew Hays 'adventurous' scheme, cause it basically fits my thoughts
" how it should look like. Is meant to use with the lightline theme
" 'blue_planet', which base on this theme here. (of cause only when lightline is
" installed)
"
" The theme require 256 colors for the terminal version.

highlight clear

if exists('syntax_on')
    syntax reset
endif

set background=dark

let g:colors_name = 'blue_planet'

highlight NormalActive   ctermbg=235 ctermfg=15
highlight NormalInactive ctermbg=233 ctermfg=15

highlight Function      ctermbg=NONE ctermfg=32
highlight Comment       ctermbg=NONE ctermfg=247
highlight Constant      ctermbg=NONE ctermfg=24
highlight Conditional   ctermbg=NONE ctermfg=214
highlight Operator      ctermbg=NONE ctermfg=214
highlight Error         ctermbg=NONE ctermfg=197  cterm=reverse
highlight Identifier    ctermbg=NONE ctermfg=32
highlight Ignore        ctermbg=NONE ctermfg=NONE
highlight PreProc       ctermbg=NONE ctermfg=214
highlight Special       ctermbg=NONE ctermfg=173
highlight Statement     ctermbg=NONE ctermfg=81
highlight String        ctermbg=NONE ctermfg=191
highlight Tag           ctermbg=NONE ctermfg=220
highlight Todo          ctermbg=NONE ctermfg=NONE cterm=reverse
highlight Type          ctermbg=NONE ctermfg=197  cterm=none
highlight StorageClass  ctermbg=NONE ctermfg=220  cterm=none
highlight Underlined    ctermbg=NONE ctermfg=173  cterm=underline

highlight LineNr        ctermbg=233  ctermfg=242
highlight NonText       ctermbg=NONE ctermfg=173  cterm=bold
highlight Whitespace    ctermbg=NONE ctermfg=173  cterm=bold

highlight Pmenu         ctermbg=24   ctermfg=15
highlight PmenuSbar     ctermbg=32   ctermfg=NONE
highlight PmenuSel      ctermbg=81   ctermfg=235
highlight PmenuThumb    ctermbg=81   ctermfg=NONE

highlight ErrorMsg      ctermbg=16   ctermfg=166  cterm=reverse
highlight ModeMsg       ctermbg=NONE ctermfg=70
highlight MoreMsg       ctermbg=NONE ctermfg=109
highlight Question      ctermbg=NONE ctermfg=70
highlight WarningMsg    ctermbg=NONE ctermfg=166

highlight TabLineFill   ctermbg=NONE ctermfg=NONE
highlight TabLine       ctermbg=NONE ctermfg=NONE

highlight Cursor        ctermbg=9    ctermfg=15
highlight CursorColumn  ctermbg=9    ctermfg=15
highlight CursorLine    ctermbg=240  ctermfg=NONE
highlight CursorLineNr  ctermbg=238  ctermfg=249

highlight helpLeadBlank ctermbg=NONE ctermfg=NONE
highlight helpNormal    ctermbg=NONE ctermfg=NONE

highlight StatusLine    ctermbg=152  ctermfg=32
highlight StatusLineNC  ctermbg=32   ctermfg=152

highlight Visual        ctermbg=222  ctermfg=16
highlight VisualNOS     ctermbg=NONE ctermfg=NONE cterm=underline

highlight FoldColumn    ctermbg=233  ctermfg=81
highlight Folded        ctermbg=NONE ctermfg=81

highlight VertSplit     ctermbg=24   ctermfg=24   cterm=bold
highlight WildMenu      ctermbg=24   ctermfg=15

highlight SpecialKey    ctermbg=NONE ctermfg=59
highlight Title         ctermbg=NONE ctermfg=32   cterm=bold

highlight DiffAdd       ctermbg=191  ctermfg=16
highlight DiffChange    ctermbg=222  ctermfg=16
highlight DiffDelete    ctermbg=197  ctermfg=15
highlight DiffText      ctermbg=222  ctermfg=197  cterm=bold

highlight IncSearch     ctermbg=214  ctermfg=16
highlight Search        ctermbg=222  ctermfg=16

highlight Directory     ctermbg=NONE ctermfg=32
highlight MatchParen    ctermbg=NONE ctermfg=NONE cterm=underline

highlight SpellBad      ctermbg=NONE ctermfg=166  cterm=undercurl
highlight SpellCap      ctermbg=NONE ctermfg=68   cterm=undercurl
highlight SpellLocal    ctermbg=NONE ctermfg=68   cterm=undercurl
highlight SpellRare     ctermbg=NONE ctermfg=109  cterm=undercurl

highlight ColorColumn   ctermbg=16   ctermfg=NONE
highlight SignColumn    ctermbg=233  ctermfg=242

highlight QuickFixLine  ctermbg=81   ctermfg=235

highlight previewWord   ctermbg=191  ctermfg=0
highlight previewLine   ctermbg=197  ctermfg=0

highlight LspDiagnosticsDefaultError        ctermfg=197
highlight LspDiagnosticsDefaultWarning      ctermfg=166
highlight LspDiagnosticsDefaultInformation  ctermfg=191
highlight LspDiagnosticsDefaultHint         ctermfg=191

highlight LspReferenceText  ctermfg=191 cterm=underline
highlight LspReferenceRead  ctermfg=191 cterm=underline
highlight LspReferenceWrite ctermfg=191 cterm=reverse

" Custom (move to plugin)
highlight NormalSpecialBuffer ctermbg=NONE ctermfg=NONE cterm=bold


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
