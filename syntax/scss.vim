" Vim syntax file
" Language: SCSS (Sassy CSS)
" Acknowledgment: https://github.com/cakebaker/scss-syntax.vim/blob/master/syntax/scss.vim

if exists('b:current_syntax')
  finish
endif

" Source the CSS syntax files.
runtime! syntax/css.vim
runtime! syntax/css_*.vim
runtime! syntax/css/*.vim

syntax case ignore


" override @font-face blocks to allow scss elements inside
syntax region cssFontDescriptorBlock contained transparent matchgroup=cssBraces start="{" end="}" contains=cssError,cssUnicodeEscape,cssFontProp,cssFontAttr,cssCommonAttr,cssStringQ,cssStringQQ,cssFontDescriptorProp,cssValue.*,cssFontDescriptorFunction,cssUnicodeRange,cssFontDescriptorAttr,@comment,scssDefinition,scssFunction,scssVariable,@scssControl,scssDebug,scssError,scssWarn

syntax region scssDefinition matchgroup=cssBraces start='{' end='}' contains=cssString.*,cssInclude,cssFontDescriptor,scssAtRootStatement,@comment,scssDefinition,scssProperty,scssSelector,scssVariable,scssImport,scssExtend,scssInclude,scssInterpolation,scssFunction,@scssControl,scssWarn,scssError,scssDebug,scssReturn containedin=cssMediaBlock fold

syntax match scssSelector "_^\zs\([^:@]\|:[^ ]\|['"].*['"]\)\+{\@=_" contained contains=@scssSelectors
syntax match scssSelector "^\s*\zs\([^:@{]\|:[^ ]\|['"].*['"]\)\+\_$" contained contains=@scssSelectors
" fix for #54 to recognize a multiline selector containing a string interpolation
syntax match scssSelector "^\zs\([^:@]\|:[^ ]\)\+#{.*}[^;{]\+\_$" contained contains=@scssSelectors
syntax cluster scssSelectors contains=@comment,cssSelectorOp,cssTagName,cssPseudoClass,cssAttributeSelector,scssSelectorChar,scssAmpersand,scssInterpolation

syntax match scssProperty "\([[:alnum:]-]\)\+\s*\(:\)\@=" contained contains=css.*Prop,cssVendor containedin=cssMediaBlock nextgroup=scssAttribute,scssAttributeWithNestedDefinition
syntax match scssAttribute ":[^;]*\ze\(;\|}\)" contained contains=css.*Attr,cssValue.*,cssColor,cssFunction,cssString.*,cssURL,scssFunction,scssInterpolation,scssVariable

syntax match scssAttributeWithNestedDefinition ": [^#]*{\@=" nextgroup=scssNestedDefinition contained contains=css.*Attr,cssValue.*,scssVariable
syntax region scssNestedDefinition matchgroup=cssBraces start="{" end="}" contained contains=@comment,scssProperty,scssNestedProperty

" CSS properties from https://developer.mozilla.org/en-US/docs/Web/CSS/Reference
" align
syntax keyword scssNestedProperty contained content items self nextgroup=scssAttribute
" animation
syntax keyword scssNestedProperty contained delay direction duration fill-mode iteration-count name play-state timing-function nextgroup=scssAttribute
" background
syntax keyword scssNestedProperty contained attachment clip color image origin position repeat size nextgroup=scssAttribute
" border
syntax keyword scssNestedProperty contained bottom bottom-color bottom-left-radius bottom-right-radius bottom-style bottom-width nextgroup=scssAttribute
syntax keyword scssNestedProperty contained collapse color nextgroup=scssAttribute
syntax keyword scssNestedProperty contained image image-outset image-repeat image-slice image-source image-width nextgroup=scssAttribute
syntax keyword scssNestedProperty contained left left-color left-style left-width nextgroup=scssAttribute
syntax keyword scssNestedProperty contained radius nextgroup=scssAttribute
syntax keyword scssNestedProperty contained right right-color right-style right-width nextgroup=scssAttribute
syntax keyword scssNestedProperty contained spacing style nextgroup=scssAttribute
syntax keyword scssNestedProperty contained top top-color top-left-radius top-right-radius top-style top-width nextgroup=scssAttribute
syntax keyword scssNestedProperty contained width nextgroup=scssAttribute
" box
syntax keyword scssNestedProperty contained decoration-break shadow sizing nextgroup=scssAttribute
" break
syntax keyword scssNestedProperty contained after before inside nextgroup=scssAttribute
" column
syntax keyword scssNestedProperty contained count fill gap rule rule-color rule-style rule-width span width nextgroup=scssAttribute
" counter
syntax keyword scssNestedProperty contained increment reset nextgroup=scssAttribute
" flex
syntax keyword scssNestedProperty contained basis direction flow grow shrink wrap nextgroup=scssAttribute
" font
syntax keyword scssNestedProperty contained family feature-settings kerning language-override size size-adjust stretch style synthesis nextgroup=scssAttribute
syntax keyword scssNestedProperty contained variant variant-alternates variant-caps variant-east-asian variant-ligatures variant-numeric variant-position nextgroup=scssAttribute
syntax keyword scssNestedProperty contained weight nextgroup=scssAttribute
" image
syntax keyword scssNestedProperty contained rendering resolution orientation nextgroup=scssAttribute
" list
syntax keyword scssNestedProperty contained style style-image style-position style-type nextgroup=scssAttribute
" margin/padding
syntax keyword scssNestedProperty contained bottom left right top nextgroup=scssAttribute
" max/min
syntax keyword scssNestedProperty contained height width nextgroup=scssAttribute
" nav
syntax keyword scssNestedProperty contained down index left right up nextgroup=scssAttribute
" object
syntax keyword scssNestedProperty contained fit position nextgroup=scssAttribute
" outline
syntax keyword scssNestedProperty contained color offset style width nextgroup=scssAttribute
" overflow
syntax keyword scssNestedProperty contained wrap x y nextgroup=scssAttribute
" page
syntax keyword scssNestedProperty contained break-after break-before break-inside nextgroup=scssAttribute
" text
syntax keyword scssNestedProperty contained align align-last combine-horizontal nextgroup=scssAttribute
syntax keyword scssNestedProperty contained decoration decoration-color decoration-line decoration-style nextgroup=scssAttribute
syntax keyword scssNestedProperty contained indent orientation overflow rendering shadow transform underline-position nextgroup=scssAttribute
" transform
syntax keyword scssNestedProperty contained origin style nextgroup=scssAttribute
" transition
syntax keyword scssNestedProperty contained delay duration property timing-function nextgroup=scssAttribute
" unicode
syntax keyword scssNestedProperty contained bidi range nextgroup=scssAttribute
" word
syntax keyword scssNestedProperty contained break spacing wrap nextgroup=scssAttribute

syntax region scssInterpolation matchgroup=scssInterpolationDelimiter start="#{" end="}" contains=cssValue.*,cssColor,cssString.*,scssFunction,scssVariable containedin=cssComment,cssInclude,cssPseudoClassFn,cssPseudoClassLang,cssString.*,cssURL,scssFunction

" ignores the url() function so it can be handled by css.vim
syntax region scssFunction contained matchgroup=scssFunctionName start="\<\(url(\)\@!\([[:alnum:]-_]\)\+\s*(" skip=+([^)]*)+ end=")" keepend extend containedin=cssInclude,cssMediaType
syntax match scssParameterList ".*" contained containedin=cssFunction,scssFunction contains=css.*Attr,cssColor,cssString.*,cssValue.*,scssBoolean,scssFunction,scssInterpolation,scssMap,scssNull,scssVariable

syntax match scssVariable "$[[:alnum:]_-]\+" containedin=cssFunction,scssFunction,cssInclude,cssMediaBlock,cssMediaType nextgroup=scssVariableAssignment skipwhite
syntax match scssVariableAssignment ":" contained nextgroup=scssVariableValue skipwhite
syntax region scssVariableValue start="" end="\ze[;)]" contained contains=css.*Attr,cssValue.*,cssColor,cssFunction,cssString.*,cssURL,scssBoolean,scssDefault,scssFunction,scssInterpolation,scssNull,scssVariable,scssMap,scssGlobal,scssAmpersand,@comment
syntax match scssGlobal "!global" contained

syntax keyword scssNull null contained
syntax keyword scssBoolean true false contained
syntax keyword scssBooleanOp and or not contained

syntax match scssMixin "^@mixin" nextgroup=scssMixinName skipwhite
syntax match scssMixinName "[[:alnum:]_-]\+" contained nextgroup=scssDefinition,scssMixinParams
syntax region scssMixinParams contained contains=css.*Attr,cssColor,cssValue.*,cssString.*,cssUrl,cssBoxProp,cssDimensionProp,@comment,scssBoolean,scssNull,scssVariable,scssFunction start="(" end=")" extend
syntax match scssInclude "@include" nextgroup=scssMixinName skipwhite containedin=cssMediaBlock
syntax match scssContent "@content" contained containedin=scssDefinition

syntax match scssFunctionDefinition "^@function" nextgroup=scssFunctionNameWithWhitespace skipwhite
syntax match scssFunctionNameWithWhitespace "[[:alnum:]_-]\+\s*" contained contains=scssFunctionName nextgroup=scssFunctionParams
syntax match scssFunctionName "[[:alnum:]_-]\+" contained
syntax region scssFunctionParams contained start="(" end=")" nextgroup=scssFunctionBody contains=scssVariable skipwhite
syntax region scssFunctionBody contained matchgroup=cssBraces start="{" end="}" contains=cssString.*,cssValue.*,@scssControl,scssBooleanOp,scssComment,scssVariable,scssReturn,scssFunction,scssDebug,scssError,scssWarn,scssDefinition,scssInterpolation fold
syntax match scssReturn "@return" contained
syntax match scssExtend "@extend" nextgroup=scssExtendedSelector skipwhite containedin=cssMediaBlock
syntax match scssExtendedSelector "[^;]\+" contained contains=cssTagName,cssPseudoClass,scssOptional,scssSelectorChar skipwhite
syntax match scssOptional "!optional" contained
syntax match scssImport "@import" nextgroup=scssImportList
syntax match scssImportList "[^;]\+" contained contains=cssString.*,cssMediaType,cssURL

syntax match scssSelectorChar "\(#\|\.\|%\)\([[:alnum:]_-]\|#{.*}\)\@=" nextgroup=scssSelectorName containedin=cssMediaBlock,cssPseudoClassFn
syntax match scssSelectorName "\([[:alnum:]_-]\|#{[^}]*}\)\+" contained contains=scssInterpolation

syntax match scssAmpersand "&" nextgroup=cssPseudoClass,scssSelectorName containedin=cssMediaBlock

syntax match scssDebug "@debug" nextgroup=scssOutput
syntax match scssWarn "@warn" nextgroup=scssOutput
syntax match scssError "@error" nextgroup=scssOutput
syntax match scssOutput "[^;]\+" contained contains=cssValue.*,cssString.*,scssFunction,scssVariable
syntax match scssDefault "!default" contained

syntax match scssIf "@\=if" nextgroup=scssCondition
syntax match scssCondition "[^{]\+" contained contains=cssValue.*,cssString.*,scssBoolean,scssBooleanOp,scssFunction,scssNull,scssVariable,scssAmpersand
syntax match scssElse "@else" nextgroup=scssIf
syntax match scssElse "@else\(\s*\({\|$\)\)\@="
syntax match scssWhile "@while" nextgroup=scssCondition
syntax match scssFor "@for\s\+.*from\s\+.*\(to\|through\)\s\+[^{ ]\+" contains=cssValueNumber,scssFunction,scssVariable,scssForKeyword
syntax match scssForKeyword "@for\|from\|to\|through" contained
syntax region scssEach matchgroup=scssEachKeyword start="@each" end="in" contains=scssVariable nextgroup=scssCollection
syntax region scssCollection start=" " end="\ze{" contained contains=scssFunction,scssMap,scssVariable
syntax cluster scssControl contains=scssIf,scssElse,scssWhile,scssFor,scssEach

syntax region scssMap matchgroup=scssMapParens start="[^:alpha:]\=\zs(\ze\(\s*\n.*:\|.\+:\)" end=")" contains=@comment,scssMapKey extend
syntax match scssMapKey "[^: ]\+\ze[:]" contained contains=css.*Attr,cssString.*,scssVariable nextgroup=scssMapValue
syntax match scssMapValue "[^,)]\+\ze[,)]" contained contains=cssColor,css.*Prop,cssString.*,cssValueLength,scssBoolean,scssFunction,scssNull,scssVariable

syntax region scssAtRootStatement start="@at-root" end="\ze{" contains=@scssSelectors,scssAtRoot
syntax match scssAtRoot "@at-root" contained
syntax match scssAtRoot "(\zswith\(out\)\=\ze:" contained

syntax match scssComment "//.*$" contains=@Spell containedin=cssMediaBlock
syntax cluster comment contains=cssComment,scssComment
syntax match scssStickyCommentChar "^\/\*\zs!" contained containedin=cssComment
syntax keyword scssTodo TODO FIXME NOTE OPTIMIZE XXX contained containedin=@comment

highlight def link scssNestedProperty cssProp
highlight def link scssVariable  Identifier
highlight def link scssGlobal    Special
highlight def link scssNull      Constant
highlight def link scssBoolean   Constant
highlight def link scssBooleanOp Operator
highlight def link scssMixin     PreProc
highlight def link scssMixinName Function
highlight def link scssContent   PreProc
highlight def link scssFunctionDefinition  PreProc
highlight def link scssFunctionName Function
highlight def link scssReturn    Statement
highlight def link scssInclude   PreProc
highlight def link scssExtend    PreProc
highlight def link scssOptional  Special
highlight def link scssComment   Comment
highlight def link scssStickyCommentChar Special
highlight def link scssSelectorChar Special
highlight def link scssSelectorName Identifier
highlight def link scssAmpersand Character
highlight def link scssDebug     Debug
highlight def link scssWarn      Debug
highlight def link scssError     Debug
highlight def link scssDefault   Special
highlight def link scssIf        Conditional
highlight def link scssElse      Conditional
highlight def link scssWhile     Repeat
highlight def link scssForKeyword  Repeat
highlight def link scssEachKeyword Repeat
highlight def link scssInterpolationDelimiter Delimiter
highlight def link scssImport    Include
highlight def link scssTodo      Todo
highlight def link scssAtRoot    Keyword
highlight def link scssMapParens Delimiter
