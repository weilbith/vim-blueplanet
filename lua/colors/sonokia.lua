-----------------------------------------------------------------------------
-- Name:         Sonokia
-- Description:  Daughter of Sonokai anchestor of Monokai
-- License:      MIT
-----------------------------------------------------------------------------

-- luacheck: ignore 113
local lush = require("lush")
local hsl = lush.hsl

return lush(
    function()
        return {
            -- Base
            Underlined {gui = "underline"},
            Reversed {gui = "reverse"},
            White {fg = hsl("#f1f1f2")},
            Black {fg = hsl("#131416")},
            Grey {fg = hsl("#7f8490")},
            Red {fg = hsl("#fc5d7c")},
            Orange {fg = hsl("#f39660")},
            Yellow {fg = hsl("#e7c664")},
            Green {fg = hsl("#9ed072")},
            Blue {fg = hsl("#76cce0")},
            Purple {fg = hsl("#b39df3")},
            WhiteBackground {bg = White.fg},
            BlackBackground {bg = Black.fg},
            GreyBackground {bg = Grey.fg},
            RedBackground {bg = Red.fg},
            OrangeBackground {bg = Orange.fg},
            YellowBackground {bg = Yellow.fg},
            GreenBackground {bg = Green.fg},
            BlueBackground {bg = Blue.fg},
            PurpleBackground {bg = Purple.fg},
            WhiteBold {White, gui = "bold"},
            BlackBold {Black, gui = "bold"},
            GreyBold {Grey, gui = "bold"},
            RedBold {Red, gui = "bold"},
            OrangeBold {Orange, gui = "bold"},
            YellowBold {Yellow, gui = "bold"},
            GreenBold {Green, gui = "bold"},
            BlueBold {Blue, gui = "bold"},
            PurpleBold {Purple, gui = "bold"},
            WhiteItalic {White, gui = "italic"},
            BlackItalic {Black, gui = "italic"},
            GreyItalic {Grey, gui = "italic"},
            RedItalic {Red, gui = "italic"},
            OrangeItalic {Orange, gui = "italic"},
            YellowItalic {Yellow, gui = "italic"},
            GreenItalic {Green, gui = "italic"},
            BlueItalic {Blue, gui = "italic"},
            PurpleItalic {Purple, gui = "italic"},
            WhiteUnderline {White, gui = "underline"},
            BlackUnderline {Black, gui = "underline"},
            GreyUnderline {Grey, gui = "underline"},
            RedUnderline {Red, gui = "underline"},
            OrangeUnderline {Orange, gui = "underline"},
            YellowUnderline {Yellow, gui = "underline"},
            GreenUnderline {Green, gui = "underline"},
            BlueUnderline {Blue, gui = "underline"},
            PurpleUnderline {Purple, gui = "underline"},
            -- UI
            Normal {White, bg = BlackBackground.bg.lighten(5)},
            NormalInactive {White, bg = BlackBackground.bg},
            NormalFloat {White, bg = hsl("#363944")},
            Terminal {NormalFloat},
            Folded {GreyBold},
            ToolbarLine {NormalInactive},
            LineNr {Grey},
            SignColumn {Grey},
            FoldColumn {GreyBold},
            Search {BlackBold, bg = GreenBackground.bg},
            IncSearch {BlackBold, bg = BlueBackground.bg},
            Conceal {Grey},
            Cursor {Reversed},
            CursorColumn {bg = hsl("#3d3f47")},
            ColorColumn {CursorColumn},
            CursorLine {CursorColumn},
            CursorLineNr {White},
            DiffAdd {GreenBold},
            DiffChange {BlueBold},
            DiffDelete {RedBold},
            DiffText {Black, bg = WhiteBackground.bg},
            Directory {Green},
            ErrorMsg {Black, bg = RedBackground.bg, gui = "bold,underline"},
            WarningMsg {GreenBold},
            ModeMsg {WhiteBold},
            MoreMsg {BlueBold},
            MatchParen {Search},
            Whitespace {fg = hsl("#414550")},
            NonSpace {Whitespace},
            SpecialKey {Whitespace},
            Pmenu {White, bg = hsl("#363944")},
            PmenuSbar {bg = hsl("#363944")},
            PmenuSel {GreenBackground},
            PmenuThumb {GreyBackground},
            WildMenu {PmenuSel},
            Question {Yellow},
            SpellBad {RedUnderline},
            SpellCap {GreenUnderline},
            SpellLocal {BlueUnderline},
            SpellRare {PurpleUnderline},
            StatusLine {White, bg = hsl("#3b3e48")},
            StatusLineTerm {StatusLine},
            StatusLineNC {Grey, bg = hsl("#3d3f47")},
            StatusLineTermNC {StatusLineNC},
            TabLine {White, bg = hsl("#414550")},
            TabLineFill {StatusLineNC},
            TabLineSel {RedBackground},
            VertSplit {fg = hsl("#3d3f47"), bg = hsl("#3d3f47")},
            Visual {BlueBackground},
            VisualNOS {RedBackground},
            QuickFixLine {OrangeBackground},
            TermCursor {Cursor},
            -- Special
            Debug {Yellow},
            debugPC {GreenBackground},
            debugBreakpoint {RedBackground},
            ToolbarButton {BlueBackground},
            Substitute {YellowBackground},
            healthError {Red},
            healthSuccess {Green},
            healthWarning {Yellow},
            LspDiagnosticsDefaultError {Red},
            LspDiagnosticsDefaultWarning {Orange},
            LspDiagnosticsDefaultInformation {Yellow},
            LspDiagnosticsDefaultHint {Blue},
            LspDiagnosticsSignError {RedBold},
            LspDiagnosticsSignWarning {OrangeBold},
            LspDiagnosticsSignInformation {YellowBold},
            LspDiagnosticsSignHint {BlueBold},
            LspReferenceText {Underlined},
            LspReferenceRead {Underlined},
            LspReferenceWrite {Reversed},
            -- Syntax
            Type {BlueItalic},
            Structure {BlueItalic},
            StorageClass {BlueItalic},
            Identifier {OrangeItalic},
            Constant {OrangeItalic},
            PreProc {Red},
            PreCondit {Red},
            Include {Red},
            Keyword {Red},
            Define {Red},
            Typedef {Red},
            Exception {Red},
            Conditiona {Red},
            Repeat {Red},
            Statement {Red},
            Error {Red},
            Operator {Red},
            Macro {Purple},
            Label {Purple},
            Special {Purple},
            SpecialChar {Purple},
            Boolean {Purple},
            Number {Purple},
            Float {Purple},
            String {Yellow},
            Character {Yellow},
            Function {Green},
            Title {RedBold},
            Tag {Orange},
            Delimiter {White},
            Comment {GreyItalic},
            SpecialComment {GreyBold},
            Todo {BlueItalic},
            Ignore {Grey},
            CurrentWord {bg = hsl("#363944"), gui = "bold,underline"},
            -- Improve some built-in supported file-types that don't use tree sitter.
            -- Vim Script
            vimCommentTitle {GreyBold},
            vimLet {Red},
            vimFunction {Green},
            vimIsCommand {White},
            vimUserFunc {Green},
            vimFuncName {Green},
            vimMap {Blue},
            vimNotation {Purple},
            vimMapLhs {Green},
            vimMapRhs {Green},
            vimSetEqual {Blue},
            vimSetSep {White},
            vimOption {Blue},
            vimUserAttrbKey {Blue},
            vimUserAttrb {Green},
            vimAutoCmdSfxList {Orange},
            vimSynType {Orange},
            vimHiBang {Orange},
            -- vimSetSep {Grey},
            vimSet {Blue},
            -- Vim Help
            helpNote {PurpleBold},
            helpHeadline {RedBold},
            helpHeader {OrangeBold},
            helpURL {GreenUnderline},
            helpHyperTextEntry {BlueBold},
            helpHyperTextJump {Blue},
            helpCommand {Yellow},
            helpExample {Green},
            helpSpecial {Purple},
            helpSectionDelim {Grey},
            -- Git Diff
            diffAdded {Green},
            diffRemoved {Red},
            diffChanged {Blue},
            diffOldFile {Yellow},
            diffNewFile {Orange},
            diffFile {Purple},
            diffLine {Grey},
            diffIndexLine {Purple},
            -- Makefile
            makeIdent {Purple},
            makeSpecTarget {Blue},
            makeTarget {Orange},
            gitcommitFile {Green}
        }
    end
)
