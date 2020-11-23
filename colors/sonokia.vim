" -----------------------------------------------------------------------------
" Name:         Sonokia
" Description:  Daughter of Sonokai anchestor of Monokai
" License:      MIT
" -----------------------------------------------------------------------------

highlight! clear

if exists('syntax_on')
  syntax reset
endif

let g:colors_name = 'sonokia'

" Base highlight! groups that are easy to adopt an can be linked persistently.
highlight! White   guifg=#f1f1f2 guibg=NONE
highlight! Grey    guifg=#7f8490 guibg=NONE
highlight! Red     guifg=#fc5d7c guibg=NONE
highlight! Orange  guifg=#f39660 guibg=NONE
highlight! Yellow  guifg=#e7c664 guibg=NONE
highlight! Green   guifg=#9ed072 guibg=NONE
highlight! Blue    guifg=#76cce0 guibg=NONE
highlight! Purple  guifg=#b39df3 guibg=NONE

highlight! WhiteBackground    guifg=NONE    guibg=#f1f1f2
highlight! GreyBackground     guifg=NONE    guibg=#7f8490
highlight! RedBackground      guifg=#17181b guibg=#fc5d7c
highlight! OrangeBackground   guifg=#17181b guibg=#f39660
highlight! YellowBackground   guifg=#17181b guibg=#e7c664
highlight! GreenBackground    guifg=#17181b guibg=#9ed072
highlight! BlueBackground     guifg=#17181b guibg=#76cce0
highlight! PurpleBackground   guifg=#17181b guibg=#b39df3

highlight! WhiteBold   guifg=#f1f1f2 guibg=NONE gui=bold
highlight! GreyBold    guifg=#7f8490 guibg=NONE gui=bold
highlight! RedBold     guifg=#fc5d7c guibg=NONE gui=bold
highlight! OrangeBold  guifg=#f39660 guibg=NONE gui=bold
highlight! YellowBold  guifg=#e7c664 guibg=NONE gui=bold
highlight! GreenBold   guifg=#9ed072 guibg=NONE gui=bold
highlight! BlueBold    guifg=#76cce0 guibg=NONE gui=bold
highlight! PurpleBold  guifg=#b39df3 guibg=NONE gui=bold

highlight! WhiteItalic   guifg=#f1f1f2 guibg=NONE gui=italic
highlight! GreyItalic    guifg=#7f8490 guibg=NONE gui=italic
highlight! RedItalic     guifg=#fc5d7c guibg=NONE gui=italic
highlight! OrangeItalic  guifg=#f39660 guibg=NONE gui=italic
highlight! YellowItalic  guifg=#e7c664 guibg=NONE gui=italic
highlight! GreenItalic   guifg=#9ed072 guibg=NONE gui=italic
highlight! BlueItalic    guifg=#76cce0 guibg=NONE gui=italic
highlight! PurpleItalic  guifg=#b39df3 guibg=NONE gui=italic

highlight! WhiteUnderlin    guifg=#f1f1f2 guibg=NONE gui=underline
highlight! GreyUnderlin     guifg=#7f8490 guibg=NONE gui=underline
highlight! RedUnderline     guifg=#fc5d7c guibg=NONE gui=underline
highlight! OrangeUnderline  guifg=#f39660 guibg=NONE gui=underline
highlight! YellowUnderline  guifg=#e7c664 guibg=NONE gui=underline
highlight! GreenUnderline   guifg=#9ed072 guibg=NONE gui=underline
highlight! BlueUnderline    guifg=#76cce0 guibg=NONE gui=underline
highlight! PurpleUnderline  guifg=#b39df3 guibg=NONE gui=underline

highlight! Underlined   guifg=NONE  guibg=NONE  gui=underline
highlight! Reversed     guifg=NONE  guibg=NONE  gui=reverse

" UI
highlight! Normal             guifg=#f1f1f2 guibg=#17181b
highlight! NormalInactive     guifg=#f1f1f2 guibg=#0c0d0f
highlight! NormalFloat        guifg=#f1f1f2 guibg=#363944
highlight! Terminal           guifg=#f1f1f2 guibg=#17181b
highlight! Folded             guifg=#7f8490 guibg=#3d3f47 gui=bold
highlight! ToolbarLine        guifg=#f1f1f2 guibg=#363944
highlight! link LineNr        Grey
highlight! link SignColumn    Grey
highlight! link FoldColumn    GreyBold
highlight! Search             guifg=#17181b guibg=#a7df78 gui=bold
highlight! IncSearch          guifg=#17181b guibg=#76cce0 gui=bold
highlight! ColorColumn        guifg=NONE    guibg=#3d3f47
highlight! link Conceal       Grey
highlight! Cursor             guifg=NONE    guibg=NONE    gui=reverse
highlight! CursorColumn       guifg=NONE    guibg=#3d3f47
highlight! CursorLine         guifg=NONE    guibg=#3d3f47
highlight! link CursorLineNr  White
highlight! link DiffAdd       GreenBold
highlight! link DiffChange    BlueBold
highlight! link DiffDelete    RedBold
highlight! DiffText           guifg=#17181b guibg=#f1f1f2
highlight! link Directory     Green
highlight! ErrorMsg           guifg=#17181b guibg=#ff6077 gui=bold,underline
highlight! link WarningMsg    GreenBold
highlight! link ModeMsg       WhiteBold
highlight! link MoreMsg       BlueBold
highlight! link MatchParen    Search
highlight! NonText            guifg=#414550 guibg=NONE
highlight! Whitespace         guifg=#414550 guibg=NONE
highlight! SpecialKey         guifg=#414550 guibg=NONE
highlight! Pmenu              guifg=#f1f1f2 guibg=#363944
highlight! PmenuSbar          guifg=NONE    guibg=#363944
highlight! link PmenuSel      GreenBackground
highlight! link PmenuThumb    GreyBackground
highlight! link WildMenu      PmenuSel
highlight! link Question      Yellow
highlight! link SpellBad      RedUnderline
highlight! link SpellCap      GreenUnderline
highlight! link SpellLocal    BlueUnderline
highlight! link SpellRare     PurpleUnderlin
highlight! StatusLine         guifg=#f1f1f2 guibg=#3b3e48
highlight! StatusLineTerm     guifg=#f1f1f2 guibg=#3b3e48
highlight! StatusLineNC       guifg=#7f8490 guibg=#3d3f47
highlight! StatusLineTermNC   guifg=#7f8490 guibg=#3d3f47
highlight! TabLine            guifg=#f1f1f2 guibg=#414550
highlight! TabLineFill        guifg=#7f8490 guibg=#3d3f47
highlight! link TabLineSel    RedBackground
highlight! VertSplit          guifg=#3d3f47 guibg=#3d3f47
highlight! link Visual        BlueBackground
highlight! link VisualNOS     RedBackground
highlight! link QuickFixLine  OrangeBackground
highlight! link TermCursor    Cursor

highlight! link Debug             Yellow
highlight! link debugPC           GreenBackground
highlight! link debugBreakpoint   RedBackground
highlight! link ToolbarButton     BlueBackground
highlight! link Substitute        YellowBackground

highlight! link healthError                Red
highlight! link healthSuccess              Green
highlight! link healthWarning              Yellow

highlight! link LspDiagnosticsDefaultError       Red
highlight! link LspDiagnosticsDefaultWarning     Orange
highlight! link LspDiagnosticsDefaultInformation Yellow
highlight! link LspDiagnosticsDefaultHint        Blue

highlight! link LspDiagnosticsSignError       RedBold
highlight! link LspDiagnosticsSignWarning     OrangeBold
highlight! link LspDiagnosticsSignInformation YellowBold
highlight! link LspDiagnosticsSignHint        BlueBold

highlight! link LspReferenceText  Underlined
highlight! link LspReferenceRead  Underlined
highlight! link LspReferenceWrite Reversed

highlight! clear ErrorLine
highlight! clear WarningLine
highlight! clear InfoLine
highlight! clear HintLine

" Syntax
highlight! link Type            BlueItalic
highlight! link Structure       BlueItalic
highlight! link StorageClass    BlueItalic
highlight! link Identifier      OrangeItalic
highlight! link Constant        OrangeItalic
highlight! link PreProc         Red
highlight! link PreCondit       Red
highlight! link Include         Red
highlight! link Keyword         Red
highlight! link Define          Red
highlight! link Typedef         Red
highlight! link Exception       Red
highlight! link Conditiona      Red
highlight! link Repeat          Red
highlight! link Statement       Red
highlight! link Error           Red
highlight! link Operator        Red
highlight! link Macro           Purple
highlight! link Label           Purple
highlight! link Special         Purple
highlight! link SpecialChar     Purple
highlight! link Boolean         Purple
highlight! link Number          Purple
highlight! link Float           Purple
highlight! link String          Yellow
highlight! link Character       Yellow
highlight! link Function        Green
highlight! link Title           RedBold
highlight! link Tag             Orange
highlight! link Delimiter       White
highlight! link Comment         GreyItalic
highlight! link SpecialComment  GreyBold
highlight! link Todo            BlueItalic
highlight! link Ignore          Grey
highlight! CurrentWord          guifg=NONE    guibg=#363944 gui=bold,underline


" Improve some built-in supported file-types that don't use tree sitter.

" Vim Script
highlight! link vimCommentTitle   GreyBold
highlight! link vimLet            Red
highlight! link vimFunction       Green
highlight! link vimIsCommand      White
highlight! link vimUserFunc       Green
highlight! link vimFuncName       Green
highlight! link vimMap            Blue
highlight! link vimNotation       Purple
highlight! link vimMapLhs         Green
highlight! link vimMapRhs         Green
highlight! link vimSetEqual       Blue
highlight! link vimSetSep         White
highlight! link vimOption         Blue
highlight! link vimUserAttrbKey   Blue
highlight! link vimUserAttrb      Green
highlight! link vimAutoCmdSfxList Orange
highlight! link vimSynType        Orange
highlight! link vimHiBang         Orange
highlight! link vimSet            Blue
highlight! link vimSetSep         Grey

" Vim Help
highlight! link helpNote            PurpleBold
highlight! link helpHeadline        RedBold
highlight! link helpHeader          OrangeBold
highlight! link helpURL             GreenUnderline
highlight! link helpHyperTextEntry  BlueBold
highlight! link helpHyperTextJump   Blue
highlight! link helpCommand         Yellow
highlight! link helpExample         Green
highlight! link helpSpecial         Purple
highlight! link helpSectionDelim    Grey

" Git Diff
highlight! link diffAdded     Green
highlight! link diffRemoved   Red
highlight! link diffChanged   Blue
highlight! link diffOldFile   Yellow
highlight! link diffNewFile   Orange
highlight! link diffFile      Purple
highlight! link diffLine      Grey
highlight! link diffIndexLine Purple

" Makefile
highlight! link makeIdent       Purple
highlight! link makeSpecTarget  Blue
highlight! link makeTarget      Orange
highlight! link gitcommitFile   Green
