-----------------------------------------------------------------------------
-- Name:         Sonokia
-- Description:  Daughter of Sonokai anchestor of Monokai
-- License:      MIT
-----------------------------------------------------------------------------

-- luacheck: ignore 113
local lush = require('lush')
local hsl = lush.hsl

---@diagnostic disable
return lush(function(injected_functions)
  local symbol = injected_functions.sym

  return {
    -- Base
    Cleared({ fg = 'NONE', bg = 'NONE', gui = 'NONE' }),
    Bold({ gui = 'bold' }),
    Italic({ gui = 'italic' }),
    Underlined({ gui = 'underline' }),
    Reversed({ gui = 'reverse' }),
    UnderlinedBold({ gui = 'underline,bold' }),
    ItalicBold({ gui = 'italic,bold' }),
    Strikethrough({ gui = 'strikethrough' }),
    White({ fg = hsl('#f1f1f2') }),
    Black({ fg = hsl('#18191B') }),
    Grey({ fg = hsl('#3b3e4a') }),
    DarkGrey({ fg = hsl('#2E2F33') }),
    LightGrey({ fg = hsl('#7f8490') }),
    Red({ fg = hsl('#fc5d7c') }),
    DarkRed({ fg = hsl('#3a273a') }),
    Orange({ fg = hsl('#f39660') }),
    DarkOrange({ fg = hsl('#38343d') }),
    Yellow({ fg = hsl('#e7c664') }),
    Green({ fg = hsl('#9ed072') }),
    Blue({ fg = hsl('#76cce0') }),
    DarkBlue({ fg = hsl('#252a3f') }),
    Purple({ fg = hsl('#b39df3') }),
    WhiteBackground({ bg = White.fg }),
    BlackBackground({ bg = Black.fg }),
    GreyBackground({ bg = Grey.fg }),
    DarkGreyBackground({ bg = DarkGrey.fg }),
    LightGreyBackground({ bg = LightGrey.fg }),
    RedBackground({ bg = Red.fg }),
    DarkRedBackground({ bg = DarkRed.fg }),
    OrangeBackground({ bg = Orange.fg }),
    DarkOrangeBackground({ bg = DarkOrange.fg }),
    BoldDarkOrangeBackground({ bg = DarkOrange.fg, gui = 'bold' }),
    YellowBackground({ bg = Yellow.fg }),
    GreenBackground({ bg = Green.fg }),
    BlueBackground({ bg = Blue.fg }),
    DarkBlueBackground({ bg = DarkBlue.fg }),
    BoldDarkBlueBackground({ bg = DarkBlue.fg, gui = 'bold' }),
    PurpleBackground({ bg = Purple.fg }),
    WhiteBackgroundContrast({ WhiteBackground, fg = Black.fg }),
    BlackBackgroundContrast({ BlackBackground, fg = White.fg }),
    GreyBackgroundContrast({ GreyBackground, fg = White.fg }),
    DarkGreyBackgroundContrast({ DarkGreyBackground, fg = White.fg }),
    LightGreyBackgroundContrast({ LightGreyBackground, fg = White.fg }),
    RedBackgroundContrast({ RedBackground, fg = Black.fg }),
    OrangeBackgroundContrast({ OrangeBackground, fg = Black.fg }),
    YellowBackgroundContrast({ YellowBackground, fg = Black.fg }),
    GreenBackgroundContrast({ GreenBackground, fg = Black.fg }),
    BlueBackgroundContrast({ BlueBackground, fg = Black.fg }),
    PurpleBackgroundContrast({ PurpleBackground, fg = Black.fg }),
    WhiteBold({ White, gui = 'bold' }),
    BlackBold({ Black, gui = 'bold' }),
    GreyBold({ Grey, gui = 'bold' }),
    DarkGreyBold({ DarkGrey, gui = 'bold' }),
    LightGreyBold({ LightGrey, gui = 'bold' }),
    RedBold({ Red, gui = 'bold' }),
    OrangeBold({ Orange, gui = 'bold' }),
    YellowBold({ Yellow, gui = 'bold' }),
    GreenBold({ Green, gui = 'bold' }),
    BlueBold({ Blue, gui = 'bold' }),
    PurpleBold({ Purple, gui = 'bold' }),
    WhiteItalic({ White, gui = 'italic' }),
    BlackItalic({ Black, gui = 'italic' }),
    GreyItalic({ Grey, gui = 'italic' }),
    DarkGreyItalic({ DarkGrey, gui = 'italic' }),
    LightGreyItalic({ LightGrey, gui = 'italic' }),
    RedItalic({ Red, gui = 'italic' }),
    OrangeItalic({ Orange, gui = 'italic' }),
    YellowItalic({ Yellow, gui = 'italic' }),
    GreenItalic({ Green, gui = 'italic' }),
    BlueItalic({ Blue, gui = 'italic' }),
    PurpleItalic({ Purple, gui = 'italic' }),
    WhiteUnderline({ gui = 'underline', sp = White.fg }),
    BlackUnderline({ gui = 'underline', sp = Black.fg }),
    GreyUnderline({ gui = 'underline', sp = Grey.fg }),
    DarkGreyUnderline({ gui = 'underline', sp = DarkGrey.fg }),
    LightGreyUnderline({ gui = 'underline', sp = LightGrey.fg }),
    RedUnderline({ gui = 'underline', sp = Red.fg }),
    OrangeUnderline({ gui = 'underline', sp = Orange.fg }),
    YellowUnderline({ gui = 'underline', sp = Yellow.fg }),
    GreenUnderline({ gui = 'underline', sp = Green.fg }),
    BlueUnderline({ gui = 'underline', sp = Blue.fg }),
    PurpleUnderline({ gui = 'underline', sp = Purple.fg }),
    -- Windows
    LightPopupBackground({ bg = '#313235' }),
    LightPopupBorder({ LightPopupBackground, fg = LightGrey.fg, gui = 'bold' }),
    DarkPopupBackground({ bg = '#222325' }),
    DarkPopupBorder({ DarkPopupBackground, fg = LightGrey.fg, gui = 'bold' }),
    -- UI
    Normal({ fg = BlackBackgroundContrast.fg, bg = BlackBackgroundContrast.bg }),
    NormalNC({ Normal }),
    NormalFloat({ NormalNC }),
    FloatBorder({ LightGrey }),
    Terminal({ NormalFloat }),
    Folded({ GreyBold }),
    ToolbarLine({ NormalNC }),
    LineNr({ LightGrey }),
    SignColumn({ Grey }),
    FoldColumn({ GreyBold }),
    Search({ GreenBackgroundContrast, gui = 'bold', blend = 0 }),
    IncSearch({ BlueBackgroundContrast, gui = 'bold', blend = 0 }),
    Conceal({ Grey }),
    Cursor({ Reversed }),
    CursorColumn({ bg = DarkGreyBackground.bg }),
    ColorColumn({ CursorColumn }),
    CursorLine({ CursorColumn }),
    CursorLineNr({ White }),
    DiffAdd({ bg = '#274949' }),
    DiffChange({ bg = '#252a3f' }),
    DiffText({ bg = '#394b70', gui = 'bold' }),
    DiffDelete({ fg = Red.fg, bg = '#3a273a' }),
    Directory({ Green }),
    ErrorMsg({ RedBackgroundContrast, gui = 'bold,underline' }),
    WarningMsg({ OrangeBold }),
    ModeMsg({ WhiteBold }),
    MoreMsg({ BlueBold }),
    MatchParen({ gui = 'bold,underline' }),
    Whitespace({ fg = hsl('#414550') }),
    NonSpace({ Whitespace }),
    NonText({ Whitespace }),
    SpecialKey({ Whitespace }),
    Pmenu({ GreyBackgroundContrast }),
    PmenuSbar({ Pmenu }),
    PmenuSel({ DarkBlueBackground }),
    PmenuThumb({ DarkGreyBackgroundContrast }),
    WildMenu({ PmenuSel }),
    Question({ Yellow }),
    SpellBad({ gui = 'undercurl', sp = Red.fg }),
    SpellCap({ GreenUnderline }),
    SpellLocal({ BlueUnderline }),
    SpellRare({ PurpleUnderline }),
    StatusLine({ DarkGreyBackgroundContrast }),
    StatusLineTerm({ StatusLine }),
    StatusLineNC({ fg = DarkGrey.fg, bg = DarkGreyBackground.bg }),
    StatusLineTermNC({ DarkGreyBackgroundContrast }),
    TabLine({ White, bg = RedBackground.bg }),
    TabLineFill({ GreyBackgroundContrast }),
    TabLineSel({ GreenBackgroundContrast }),
    WinSeparator({ GreyBold }),
    Visual({ DarkBlueBackground }),
    VisualNOS({ RedBackgroundContrast }),
    QuickFixLine({ OrangeBackgroundContrast }),
    TermCursor({ Cursor }),
    -- Special
    Debug({ Yellow }),
    debugPC({ GreenBackground }),
    debugBreakpoint({ RedBackground }),
    ToolbarButton({ BlueBackground }),
    Substitute({ YellowBackground }),
    healthError({ Red }),
    healthSuccess({ Green }),
    healthWarning({ Yellow }),
    -- LSP
    LspReferenceText({ Underlined }),
    LspReferenceRead({ Underlined }),
    LspReferenceWrite({ Reversed }),
    LspInlayHint({ LightGreyItalic }),
    LspCodeLens({ DarkGreyBackground, fg = LightGrey.fg, italic = true }),
    LspCodeLensSeparator({ GreyBold }),
    LspSignatureActiveParameter({ GreenBold }),
    -- Diagnostic
    DiagnosticSignError({ RedBold }),
    DiagnosticSignWarn({ OrangeBold }),
    DiagnosticSignInfo({ YellowBold }),
    DiagnosticSignHint({ BlueBold }),
    DiagnosticUnderlineError({ DarkRedBackground, sp = Red.fg, gui = 'underline' }),
    DiagnosticUnderlineWarn({ DarkOrangeBackground, sp = Orange.fg, gui = 'underline' }),
    DiagnosticUnderlineInfo({ sp = Yellow.fg, gui = 'underline' }),
    DiagnosticUnderlineHint({ sp = Blue.fg, gui = 'underline' }),
    DiagnosticVirtualTextError({ DarkRedBackground, fg = Red.fg }),
    DiagnosticVirtualTextWarn({ DarkOrangeBackground, fg = Orange.fg }),
    DiagnosticVirtualTextInfo({ DarkOrangeBackground, fg = Yellow.fg }),
    DiagnosticVirtualTextHint({ DarkBlueBackground, fg = Blue.fg }),
    -- Syntax
    Type({ BlueItalic }),
    Structure({ BlueItalic }),
    StorageClass({ BlueItalic }),
    Identifier({ OrangeItalic }),
    Constant({ OrangeItalic }),
    PreProc({ Red }),
    PreCondit({ Red }),
    Include({ Red }),
    Keyword({ Red }),
    Define({ Red }),
    Typedef({ Red }),
    Exception({ Red }),
    Conditiona({ Red }),
    Repeat({ Red }),
    Statement({ Red }),
    Error({ Red }),
    Operator({ Red }),
    Macro({ Purple }),
    Label({ Purple }),
    Special({ Purple }),
    SpecialChar({ Purple }),
    Boolean({ Purple }),
    Number({ Purple }),
    Float({ Purple }),
    String({ Yellow }),
    Character({ Yellow }),
    Function({ Green }),
    Title({ OrangeBold }),
    Tag({ Orange }),
    Delimiter({ White }),
    Comment({ LightGreyItalic }),
    SpecialComment({ GreyBold }),
    Todo({ YellowBackgroundContrast }),
    Ignore({ Grey }),
    CurrentWord({ bg = hsl('#363944'), gui = 'bold,underline' }),
    -- Improve some built-in supported file-types that don't use tree sitter.
    -- Vim Script
    vimCommentTitle({ GreyBold }),
    vimLet({ Red }),
    vimFunction({ Green }),
    vimIsCommand({ White }),
    vimUserFunc({ Green }),
    vimFuncName({ Green }),
    vimMap({ Blue }),
    vimNotation({ Purple }),
    vimMapLhs({ Green }),
    vimMapRhs({ Green }),
    vimSetEqual({ Blue }),
    vimSetSep({ White }),
    vimOption({ Blue }),
    vimUserAttrbKey({ Blue }),
    vimUserAttrb({ Green }),
    vimAutoCmdSfxList({ Orange }),
    vimSynType({ Orange }),
    vimHiBang({ Orange }),
    -- vimSetSep {Grey},
    vimSet({ Blue }),
    -- Vim Help
    helpNote({ BlueBold }),
    helpHeadline({ PurpleBold }),
    helpHeader({ OrangeBold }),
    helpURL({ GreenUnderline }),
    helpHyperTextEntry({ BlueBold }),
    helpHyperTextJump({ Blue }),
    helpCommand({ Yellow }),
    helpExample({ Green }),
    helpSpecial({ Purple }),
    helpSectionDelim({ Grey }),
    -- Git Diff
    diffAdded({ Green }),
    diffRemoved({ Red }),
    diffChanged({ Blue }),
    diffOldFile({ Yellow }),
    diffNewFile({ Orange }),
    diffFile({ Purple }),
    diffLine({ Grey }),
    diffIndexLine({ Purple }),
    -- Makefile
    makeIdent({ Purple }),
    makeSpecTarget({ Blue }),
    makeTarget({ Orange }),
    gitcommitFile({ Green }),
    -- Treesitter
    symbol('@text.todo')({ Todo }),
    symbol('@annotation')({ PreProc }),
    symbol('@attribute')({ PreProc }),
    symbol('@boolean')({ Boolean }),
    symbol('@character')({ Character }),
    symbol('@character.special')({ SpecialChar }),
    symbol('@comment')({ Comment }),
    symbol('@conditional')({ Statement }),
    symbol('@constant')({ Constant }),
    symbol('@constant.builtin')({ Special }),
    symbol('@constant.macro')({ Define }),
    symbol('@constructor')({ Special }),
    symbol('@debug')({ Debug }),
    symbol('@define')({ Define }),
    symbol('@error')({ Error }),
    symbol('@exception')({ Exception }),
    symbol('@field')({ Identifier }),
    symbol('@float')({ Float }),
    symbol('@function')({ Function }),
    symbol('@function.call')({ Function }),
    symbol('@function.builtin')({ Special }),
    symbol('@function.macro')({ Macro }),
    symbol('@include')({ Include }),
    symbol('@keyword')({ Keyword }),
    symbol('@keyword.function')({ Keyword }),
    symbol('@keyword.operator')({ Operator }),
    symbol('@keyword.return')({ Keyword }),
    symbol('@label')({ Label }),
    symbol('@method')({ Function }),
    symbol('@method.call')({ Function }),
    symbol('@namespace')({ Include }),
    symbol('@none')({ Cleared }),
    symbol('@number')({ Number }),
    symbol('@operator')({ Operator }),
    symbol('@parameter')({ Identifier }),
    symbol('@parameter.reference')({ Identifier }),
    symbol('@preproc')({ PreProc }),
    symbol('@property')({ Identifier }),
    symbol('@punctuation.delimiter')({ Delimiter }),
    symbol('@punctuation.bracket')({ Delimiter }),
    symbol('@punctuation.special')({ Delimiter }),
    symbol('@repeat')({ Repeat }),
    symbol('@storageclass')({ StorageClass }),
    symbol('@string')({ String }),
    symbol('@string.regex')({ String }),
    symbol('@string.escape')({ SpecialChar }),
    symbol('@string.special')({ SpecialChar }),
    symbol('@symbol')({ Identifier }),
    symbol('@tag')({ Tag }),
    symbol('@tag.attribute')({ Identifier }),
    symbol('@tag.delimiter')({ Delimiter }),
    symbol('@text')({ Cleared }),
    symbol('@text.strong')({ Bold }),
    symbol('@text.emphasis')({ Italic }),
    symbol('@text.underline')({ Underlined }),
    symbol('@text.strike')({ Strikethrough }),
    symbol('@text.title')({ Title }),
    symbol('@text.literal')({ String }),
    symbol('@text.uri')({ WhiteItalic }),
    symbol('@text.math')({ Special }),
    symbol('@text.reference')({ Constant }),
    symbol('@text.environment')({ Macro }),
    symbol('@text.environment.name')({ Type }),
    symbol('@text.note')({ SpecialComment }),
    symbol('@text.warning')({ Red }),
    symbol('@text.danger')({ Orange }),
    symbol('@type')({ Type }),
    symbol('@type.builtin')({ Type }),
    symbol('@type.qualifier')({ Type }),
    symbol('@type.definition')({ Typedef }),
    symbol('@variable')({ Special }),
    symbol('@variable.builtin')({ Special }),
  }
end)
