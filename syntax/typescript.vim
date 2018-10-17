" Vim syntax file
" Language: typescript
" Source: https://github.com/leafgarland/typescript/blob/master/syntax/typescript.vim

" Only load this indent file when no other was loaded.
" if exists('b:did_indent')
"   finish
" endif
"
" let b:did_indent = 1

" Dollar sign is permitted anywhere in an identifier
setlocal iskeyword+=$

syntax sync fromstart

" syntax coloring for Node.js shebang line
syn match shebang "^#!.*/bin/env\s\+node\>"
highlight def link shebang Comment

" typescript comments
syn keyword typescriptCommentTodo TODO FIXME XXX TBD contained
syn match typescriptLineComment "\/\/.*" contains=@Spell,typescriptCommentTodo,typescriptRef
syn match typescriptRefComment /\/\/\/<\(reference\|amd-\(dependency\|module\)\)\s\+.*\/>$/ contains=typescriptRefD,typescriptRefS
syn region typescriptRefD start=+"+ skip=+\\\\\|\\"+ end=+"\|$+
syn region typescriptRefS start=+'+ skip=+\\\\\|\\'+ end=+'\|$+

syn match typescriptCommentSkip "^[ \t]*\*\($\|[ \t]\+\)"
syn region typescriptComment start="/\*" end="\*/" contains=@Spell,typescriptCommentTodo extend

syntax case ignore

syntax region typescriptDocComment start="/\*\*\s*$" end="\*/" contains=typescriptDocTags,typescriptCommentTodo,typescriptCvsTag,@typescriptHtml,@Spell fold extend
syntax match typescriptDocTags contained "@\(param\|argument\|requires\|exception\|throws\|type\|class\|extends\|see\|link\|member\|module\|method\|title\|namespace\|optional\|default\|base\|file\|returns\=\)\>" nextgroup=typescriptDocParam,typescriptDocSeeTag skipwhite
syntax match typescriptDocTags contained "@\(beta\|deprecated\|description\|fileoverview\|author\|license\|version\|constructor\|private\|protected\|final\|ignore\|addon\|exec\)\>"
syntax match typescriptDocParam contained "\%(#\|\w\|\.\|:\|\/\)\+"
syntax region typescriptDocSeeTag contained matchgroup=typescriptDocSeeTag start="{" end="}" contains=typescriptDocTags

syntax case match

" Syntax in the typescript code
syn match typescriptSpecial "\\\d\d\d\|\\x\x\{2\}\|\\u\x\{4\}" contained containedin=typescriptStringD,typescriptStringS,typescriptStringB display
syn region typescriptStringD start=+"+ skip=+\\\\\|\\"+ end=+"\|$+  contains=typescriptSpecial,@htmlPreproc extend
syn region typescriptStringS start=+'+ skip=+\\\\\|\\'+ end=+'\|$+  contains=typescriptSpecial,@htmlPreproc extend
syn region typescriptStringB start=+`+ skip=+\\\\\|\\`+ end=+`+  contains=typescriptInterpolation,typescriptSpecial,@htmlPreproc extend

syn region typescriptInterpolation matchgroup=typescriptInterpolationDelimiter
      \ start=/${/ end=/}/ contained
      \ contains=@typescriptExpression

syn match typescriptNumber "-\=\<\d[0-9_]*L\=\>" display
syn match typescriptNumber "-\=\<0[xX][0-9a-fA-F][0-9a-fA-F_]*\>" display
syn match typescriptNumber "-\=\<0[bB][01][01_]*\>" display
syn match typescriptNumber "-\=\<0[oO]\o[0-7_]*\>" display
syn region typescriptRegexpString start=+/[^/*]+me=e-1 skip=+\\\\\|\\/+ end=+/[gi]\{0,2\}\s*$+ end=+/[gi]\{0,2\}\s*[;.,)\]}]+me=e-1 contains=@htmlPreproc oneline
syntax match typescriptFloat /\<-\=\%(\d[0-9_]*\.\d[0-9_]*\|\d[0-9_]*\.\|\.\d[0-9]*\)\%([eE][+-]\=\d[0-9_]*\)\=\>/
" syntax match typescriptLabel /\(?\s*\)\@<!\<\w\+\(\s*:\)\@=/

syn match typescriptDecorators /@\([_$a-zA-Z][_$a-zA-Z0-9]*\.\)*[_$a-zA-Z][_$a-zA-Z0-9]*\>/

" typescript Prototype
syntax keyword typescriptPrototype contained prototype

syntax keyword typescriptBrowserObjects window navigator screen history location

syntax keyword typescriptDOMObjects document event HTMLElement Anchor Area Base Body Button Form Frame Frameset Image Link Meta Option Select Style Table TableCell TableRow Textarea
syntax keyword typescriptDOMMethods contained createTextNode createElement insertBefore replaceChild removeChild appendChild hasChildNodes cloneNode normalize isSupported hasAttributes getAttribute setAttribute removeAttribute getAttributeNode setAttributeNode removeAttributeNode getElementsByTagName hasAttribute getElementById adoptNode close compareDocumentPosition createAttribute createCDATASection createComment createDocumentFragment createElementNS createEvent createExpression createNSResolver createProcessingInstruction createRange createTreeWalker elementFromPoint evaluate getBoxObjectFor getElementsByClassName getSelection getUserData hasFocus importNode
syntax keyword typescriptDOMProperties contained nodeName nodeValue nodeType parentNode childNodes firstChild lastChild previousSibling nextSibling attributes ownerDocument namespaceURI prefix localName tagName

syntax keyword typescriptAjaxObjects XMLHttpRequest
syntax keyword typescriptAjaxProperties contained readyState responseText responseXML statusText
syntax keyword typescriptAjaxMethods contained onreadystatechange abort getAllResponseHeaders getResponseHeader open send setRequestHeader

syntax keyword typescriptPropietaryObjects ActiveXObject
syntax keyword typescriptPropietaryMethods contained attachEvent detachEvent cancelBubble returnValue

syntax keyword typescriptHtmlElemProperties contained className clientHeight clientLeft clientTop clientWidth dir href id innerHTML lang length offsetHeight offsetLeft offsetParent offsetTop offsetWidth scrollHeight scrollLeft scrollTop scrollWidth style tabIndex target title

syntax keyword typescriptEventListenerKeywords contained blur click focus mouseover mouseout load item

syntax keyword typescriptEventListenerMethods contained scrollIntoView addEventListener dispatchEvent removeEventListener preventDefault stopPropagation
" Programm Keywords
syntax keyword typescriptSource import export from as
syntax keyword typescriptIdentifier arguments this void
syntax keyword typescriptStorageClass let var const
syntax keyword typescriptOperator delete new instanceof typeof
syntax keyword typescriptBoolean true false
syntax keyword typescriptNull null undefined
syntax keyword typescriptMessage alert confirm prompt status
syntax keyword typescriptGlobal self top parent
syntax keyword typescriptDeprecated escape unescape all applets alinkColor bgColor fgColor linkColor vlinkColor xmlEncoding

" Statement Keywords
syntax keyword typescriptConditional if else switch
syntax keyword typescriptRepeat do while for in of
syntax keyword typescriptBranch break continue yield await
syntax keyword typescriptLabel case default async readonly
syntax keyword typescriptStatement return with

syntax keyword typescriptGlobalObjects Array Boolean Date Function Infinity Math Number NaN Object Packages RegExp String Symbol netscape

syntax keyword typescriptExceptions try catch throw finally Error EvalError RangeError ReferenceError SyntaxError TypeError URIError

syntax keyword typescriptReserved constructor declare as interface module abstract enum int short export interface static byte extends long super char final native synchronized class float package throws goto private transient debugger implements protected volatile double import public type namespace from get set keyof

" typescript/DOM/HTML/CSS specified things

" typescript Objects
syn match typescriptFunction "(super\s*|constructor\s*)" contained nextgroup=typescriptVars
syn region typescriptVars start="(" end=")" contained contains=typescriptParameters transparent keepend
syn match typescriptParameters "([a-zA-Z0-9_?.$][\w?.$]*)\s*:\s*([a-zA-Z0-9_?.$][\w?.$]*)" contained skipwhite

" DOM2 Objects
syntax keyword typescriptType DOMImplementation DocumentFragment Node NodeList NamedNodeMap CharacterData Attr Element Text Comment CDATASection DocumentType Notation Entity EntityReference ProcessingInstruction void any string boolean number symbol never object unknown
syntax keyword typescriptExceptions DOMException

" DOM2 CONSTANT
syntax keyword typescriptDomErrNo INDEX_SIZE_ERR DOMSTRING_SIZE_ERR HIERARCHY_REQUEST_ERR WRONG_DOCUMENT_ERR INVALID_CHARACTER_ERR NO_DATA_ALLOWED_ERR NO_MODIFICATION_ALLOWED_ERR NOT_FOUND_ERR NOT_SUPPORTED_ERR INUSE_ATTRIBUTE_ERR INVALID_STATE_ERR SYNTAX_ERR INVALID_MODIFICATION_ERR NAMESPACE_ERR INVALID_ACCESS_ERR
syntax keyword typescriptDomNodeConsts ELEMENT_NODE ATTRIBUTE_NODE TEXT_NODE CDATA_SECTION_NODE ENTITY_REFERENCE_NODE ENTITY_NODE PROCESSING_INSTRUCTION_NODE COMMENT_NODE DOCUMENT_NODE DOCUMENT_TYPE_NODE DOCUMENT_FRAGMENT_NODE NOTATION_NODE

" HTML events and internal variables
syntax case ignore
syntax keyword typescriptHtmlEvents onblur onclick oncontextmenu ondblclick onfocus onkeydown onkeypress onkeyup onmousedown onmousemove onmouseout onmouseover onmouseup onresize onload onsubmit
syntax case match


" DOM2 things
syntax match typescriptDomElemAttrs contained /\%(nodeName\|nodeValue\|nodeType\|parentNode\|childNodes\|firstChild\|lastChild\|previousSibling\|nextSibling\|attributes\|ownerDocument\|namespaceURI\|prefix\|localName\|tagName\)\>/
syntax match typescriptDomElemFuncs contained /\%(insertBefore\|replaceChild\|removeChild\|appendChild\|hasChildNodes\|cloneNode\|normalize\|isSupported\|hasAttributes\|getAttribute\|setAttribute\|removeAttribute\|getAttributeNode\|setAttributeNode\|removeAttributeNode\|getElementsByTagName\|getAttributeNS\|setAttributeNS\|removeAttributeNS\|getAttributeNodeNS\|setAttributeNodeNS\|getElementsByTagNameNS\|hasAttribute\|hasAttributeNS\)\>/ nextgroup=typescriptParen skipwhite

" HTML things
syntax match typescriptHtmlElemAttrs contained /\%(className\|clientHeight\|clientLeft\|clientTop\|clientWidth\|dir\|id\|innerHTML\|lang\|length\|offsetHeight\|offsetLeft\|offsetParent\|offsetTop\|offsetWidth\|scrollHeight\|scrollLeft\|scrollTop\|scrollWidth\|style\|tabIndex\|title\)\>/
syntax match typescriptHtmlElemFuncs contained /\%(blur\|click\|focus\|scrollIntoView\|addEventListener\|dispatchEvent\|removeEventListener\|item\)\>/ nextgroup=typescriptParen skipwhite

" CSS Styles in typescript
syntax keyword typescriptCssStyles contained color font fontFamily fontSize fontSizeAdjust fontStretch fontStyle fontVariant fontWeight letterSpacing lineBreak lineHeight quotes rubyAlign rubyOverhang rubyPosition
syntax keyword typescriptCssStyles contained textAlign textAlignLast textAutospace textDecoration textIndent textJustify textJustifyTrim textKashidaSpace textOverflowW6 textShadow textTransform textUnderlinePosition
syntax keyword typescriptCssStyles contained unicodeBidi whiteSpace wordBreak wordSpacing wordWrap writingMode
syntax keyword typescriptCssStyles contained bottom height left position right top width zIndex
syntax keyword typescriptCssStyles contained border borderBottom borderLeft borderRight borderTop borderBottomColor borderLeftColor borderTopColor borderBottomStyle borderLeftStyle borderRightStyle borderTopStyle borderBottomWidth borderLeftWidth borderRightWidth borderTopWidth borderColor borderStyle borderWidth borderCollapse borderSpacing captionSide emptyCells tableLayout
syntax keyword typescriptCssStyles contained margin marginBottom marginLeft marginRight marginTop outline outlineColor outlineStyle outlineWidth padding paddingBottom paddingLeft paddingRight paddingTop
syntax keyword typescriptCssStyles contained listStyle listStyleImage listStylePosition listStyleType
syntax keyword typescriptCssStyles contained background backgroundAttachment backgroundColor backgroundImage gackgroundPosition backgroundPositionX backgroundPositionY backgroundRepeat
syntax keyword typescriptCssStyles contained clear clip clipBottom clipLeft clipRight clipTop content counterIncrement counterReset cssFloat cursor direction display filter layoutGrid layoutGridChar layoutGridLine layoutGridMode layoutGridType
syntax keyword typescriptCssStyles contained marks maxHeight maxWidth minHeight minWidth opacity MozOpacity overflow overflowX overflowY verticalAlign visibility zoom cssText
syntax keyword typescriptCssStyles contained scrollbar3dLightColor scrollbarArrowColor scrollbarBaseColor scrollbarDarkShadowColor scrollbarFaceColor scrollbarHighlightColor scrollbarShadowColor scrollbarTrackColor


" Highlight ways
syntax match typescriptDotNotation "\."        nextgroup=typescriptPrototype,typescriptDomElemAttrs,typescriptDomElemFuncs,typescriptDOMMethods,typescriptDOMProperties,typescriptHtmlElemAttrs,typescriptHtmlElemFuncs,typescriptHtmlElemProperties,typescriptAjaxProperties,typescriptAjaxMethods,typescriptPropietaryMethods,typescriptEventListenerMethods skipwhite skipnl
syntax match typescriptDotNotation "\.style\." nextgroup=typescriptCssStyles

" Code blocks
syntax cluster typescriptAll contains=typescriptComment,typescriptLineComment,typescriptDocComment,typescriptStringD,typescriptStringS,typescriptStringB,typescriptRegexpString,typescriptNumber,typescriptFloat,typescriptDecorators,typescriptLabel,typescriptSource,typescriptType,typescriptOperator,typescriptBoolean,typescriptNull,typescriptFuncKeyword,typescriptConditional,typescriptGlobal,typescriptRepeat,typescriptBranch,typescriptStatement,typescriptGlobalObjects,typescriptMessage,typescriptIdentifier,typescriptStorageClass,typescriptExceptions,typescriptReserved,typescriptDeprecated,typescriptDomErrNo,typescriptDomNodeConsts,typescriptHtmlEvents,typescriptDotNotation,typescriptBrowserObjects,typescriptDOMObjects,typescriptAjaxObjects,typescriptPropietaryObjects,typescriptDOMMethods,typescriptHtmlElemProperties,typescriptDOMProperties,typescriptEventListenerKeywords,typescriptEventListenerMethods,typescriptAjaxProperties,typescriptAjaxMethods,typescriptFuncArg

syntax keyword typescriptFuncKeyword function

syn match typescriptBraces "[{}\[\]]"
syn match typescriptParens "[()]"
syn match typescriptOpSymbols "=\{1,3}\|!==\|!=\|<\|>\|>=\|<=\|++\|+=\|--\|-="
syn match typescriptEndColons "[;,]"
syn match typescriptLogicSymbols "\(&&\)\|\(||\)"

" skip curly braces inside RegEx's and comments
syn region foldBraces start=/{/ skip=/\(\/\/.*\)\|\(\/.*\/\)/ end=/}/ transparent fold keepend extend

" Define the default highlighting.
" typescript highlighting
highlight def link typescriptParameters Operator
highlight def link typescriptSuperBlock Operator

highlight def link typescriptEndColons Exception
highlight def link typescriptOpSymbols Operator
highlight def link typescriptLogicSymbols Boolean
highlight def link typescriptBraces Function
highlight def link typescriptParens Operator
highlight def link typescriptComment Comment
highlight def link typescriptLineComment Comment
highlight def link typescriptRefComment Include
highlight def link typescriptRefS String
highlight def link typescriptRefD String
highlight def link typescriptDocComment Comment
highlight def link typescriptCommentTodo Todo
highlight def link typescriptCvsTag Function
highlight def link typescriptDocTags Special
highlight def link typescriptDocSeeTag Function
highlight def link typescriptDocParam Function
highlight def link typescriptStringS String
highlight def link typescriptStringD String
highlight def link typescriptStringB String
highlight def link typescriptInterpolationDelimiter Delimiter
highlight def link typescriptRegexpString String
highlight def link typescriptGlobal Constant
highlight def link typescriptCharacter Character
highlight def link typescriptPrototype Type
highlight def link typescriptConditional Conditional
highlight def link typescriptBranch Conditional
highlight def link typescriptIdentifier Identifier
highlight def link typescriptStorageClass StorageClass
highlight def link typescriptRepeat Repeat
highlight def link typescriptStatement Statement
highlight def link typescriptFuncKeyword Function
highlight def link typescriptMessage Keyword
highlight def link typescriptDeprecated Exception
highlight def link typescriptError Error
highlight def link typescriptParensError Error
highlight def link typescriptParensErrA Error
highlight def link typescriptParensErrB Error
highlight def link typescriptParensErrC Error
highlight def link typescriptReserved Keyword
highlight def link typescriptOperator Operator
highlight def link typescriptType Type
highlight def link typescriptNull Type
highlight def link typescriptNumber Number
highlight def link typescriptFloat Number
highlight def link typescriptDecorators Special
highlight def link typescriptBoolean Boolean
highlight def link typescriptLabel Label
highlight def link typescriptSpecial Special
highlight def link typescriptSource Special
highlight def link typescriptGlobalObjects Special
highlight def link typescriptExceptions Special

highlight def link typescriptDomErrNo Constant
highlight def link typescriptDomNodeConsts Constant
highlight def link typescriptDomElemAttrs Label
highlight def link typescriptDomElemFuncs PreProc

highlight def link typescriptHtmlElemAttrs Label
highlight def link typescriptHtmlElemFuncs PreProc

highlight def link typescriptCssStyles Label

" Ajax Highlighting
highlight def link typescriptBrowserObjects Constant

highlight def link typescriptDOMObjects Constant
highlight def link typescriptDOMMethods Function
highlight def link typescriptDOMProperties Special

highlight def link typescriptAjaxObjects Constant
highlight def link typescriptAjaxMethods Function
highlight def link typescriptAjaxProperties Special

highlight def link typescriptFuncDef Title
highlight def link typescriptFuncArg Special
highlight def link typescriptFuncComma Operator

highlight def link typescriptHtmlEvents Special
highlight def link typescriptHtmlElemProperties Special

highlight def link typescriptEventListenerKeywords Keyword

highlight def link typescriptNumber Number
highlight def link typescriptPropietaryObjects Constant

" Define the htmltypescript for HTML syntax html.vim
" syntax clear htmltypescript
" syntax clear typescriptExpression
syntax cluster htmltypescript contains=@typescriptAll,typescriptBracket,typescriptParen,typescriptBlock,typescriptParenError
syntax cluster typescriptExpression contains=@typescriptAll,typescriptBracket,typescriptParen,typescriptBlock,typescriptParenError,@htmlPreproc
