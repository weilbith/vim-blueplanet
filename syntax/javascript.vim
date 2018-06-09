" Vim syntax file
" Language: JavaScript
" Acknowledgment: https://github.com/pangloss/vim-javascript

if exists('b:current_syntax')
  finish
endif


syntax sync fromstart
syntax case match

syntax match   jsNoise          /[:,;]/
syntax match   jsNoise          /\./ skipwhite skipempty nextgroup=jsObjectProp,jsFuncCall,jsPrototype,jsTaggedTemplate
syntax match   jsObjectProp     contained /\<\K\k*/
syntax match   jsFuncCall       /\<\K\k*\ze\s*(/
syntax match   jsParensError    /[)}\]]/

" Program Keywords
syntax keyword jsStorageClass   const var let skipwhite skipempty nextgroup=jsDestructuringBlock,jsDestructuringArray,jsVariableDef
syntax match   jsVariableDef    contained /\<\K\k*/ skipwhite skipempty nextgroup=jsFlowDefinition
syntax keyword jsOperatorKeyword delete instanceof typeof void new in of skipwhite skipempty nextgroup=@jsExpression
syntax match   jsOperator       "[-!|&+<>=%/*~^]" skipwhite skipempty nextgroup=@jsExpression
syntax match   jsOperator       /::/ skipwhite skipempty nextgroup=@jsExpression
syntax keyword jsBooleanTrue    true
syntax keyword jsBooleanFalse   false

" Modules
syntax keyword jsImport                       import skipwhite skipempty nextgroup=jsModuleAsterisk,jsModuleKeyword,jsModuleGroup,jsFlowImportType
syntax keyword jsExport                       export skipwhite skipempty nextgroup=@jsAll,jsModuleGroup,jsExportDefault,jsModuleAsterisk,jsModuleKeyword,jsFlowTypeStatement
syntax match   jsModuleKeyword      contained /\<\K\k*/ skipwhite skipempty nextgroup=jsModuleAs,jsFrom,jsModuleComma
syntax keyword jsExportDefault      contained default skipwhite skipempty nextgroup=@jsExpression
syntax keyword jsExportDefaultGroup contained default skipwhite skipempty nextgroup=jsModuleAs,jsFrom,jsModuleComma
syntax match   jsModuleAsterisk     contained /\*/ skipwhite skipempty nextgroup=jsModuleKeyword,jsModuleAs,jsFrom
syntax keyword jsModuleAs           contained as skipwhite skipempty nextgroup=jsModuleKeyword,jsExportDefaultGroup
syntax keyword jsFrom               contained from skipwhite skipempty nextgroup=jsString
syntax match   jsModuleComma        contained /,/ skipwhite skipempty nextgroup=jsModuleKeyword,jsModuleAsterisk,jsModuleGroup,jsFlowTypeKeyword

" Strings, Templates, Numbers
syntax region  jsString           start=+\z(["']\)+  skip=+\\\%(\z1\|$\)+  end=+\z1\|$+  contains=jsSpecial,@Spell extend
syntax region  jsTemplateString   start=+`+  skip=+\\`+  end=+`+     contains=jsTemplateExpression,jsSpecial,@Spell extend
syntax match   jsTaggedTemplate   /\<\K\k*\ze`/ nextgroup=jsTemplateString
syntax match   jsNumber           /\c\<\%(\d\+\%(e[+-]\=\d\+\)\=\|0b[01]\+\|0o\o\+\|0x\x\+\)\>/
syntax keyword jsNumber           Infinity
syntax match   jsFloat            /\c\<\%(\d\+\.\d\+\|\d\+\.\|\.\d\+\)\%(e[+-]\=\d\+\)\=\>/

" Regular Expressions
syntax match   jsSpecial            contained "\v\\%(x\x\x|u%(\x{4}|\{\x{4,5}})|c\u|.)"
syntax region  jsTemplateExpression contained matchgroup=jsTemplateBraces start=+${+ end=+}+ contains=@jsExpression keepend
syntax region  jsRegexpCharClass    contained start=+\[+ skip=+\\.+ end=+\]+ contains=jsSpecial
syntax match   jsRegexpBoundary     contained "\v\c[$^]|\\b"
syntax match   jsRegexpBackRef      contained "\v\\[1-9]\d*"
syntax match   jsRegexpQuantifier   contained "\v[^\\]%([?*+]|\{\d+%(,\d*)?})\??"lc=1
syntax match   jsRegexpOr           contained "|"
syntax match   jsRegexpMod          contained "\v\(\?[:=!>]"lc=1
syntax region  jsRegexpGroup        contained start="[^\\]("lc=1 skip="\\.\|\[\(\\.\|[^]]\+\)\]" end=")" contains=jsRegexpCharClass,@jsRegexpSpecial keepend
syntax region  jsRegexpString   start=+\%(\%(\<return\|\<typeof\|\_[^)\]'"[:blank:][:alnum:]_$]\)\s*\)\@<=/\ze[^*/]+ skip=+\\.\|\[[^]]\{1,}\]+ end=+/[gimyus]\{,6}+ contains=jsRegexpCharClass,jsRegexpGroup,@jsRegexpSpecial oneline keepend extend
syntax cluster jsRegexpSpecial    contains=jsSpecial,jsRegexpBoundary,jsRegexpBackRef,jsRegexpQuantifier,jsRegexpOr,jsRegexpMod

" Objects
syntax match   jsObjectKey         contained /\<\k*\ze\s*:/ contains=jsFunctionKey skipwhite skipempty nextgroup=jsObjectValue
syntax match   jsObjectColon       contained /:/ skipwhite skipempty
syntax region  jsObjectKeyString   contained start=+\z(["']\)+  skip=+\\\%(\z1\|$\)+  end=+\z1\|$+  contains=jsSpecial,@Spell skipwhite skipempty nextgroup=jsObjectValue
syntax region  jsObjectKeyComputed contained matchgroup=jsBrackets start=/\[/ end=/]/ contains=@jsExpression skipwhite skipempty nextgroup=jsObjectValue,jsFuncArgs extend
syntax match   jsObjectSeparator   contained /,/
syntax region  jsObjectValue       contained matchgroup=jsNoise start=/:/ end=/[,}]\@=/ contains=@jsExpression extend
syntax match   jsObjectFuncName    contained /\<\K\k*\ze\_s*(/ skipwhite skipempty nextgroup=jsFuncArgs
syntax match   jsFunctionKey       contained /\<\K\k*\ze\s*:\s*function\>/
syntax match   jsObjectMethodType  contained /\<[gs]et\ze\s\+\K\k*/ skipwhite skipempty nextgroup=jsObjectFuncName
syntax region  jsObjectStringKey   contained start=+\z(["']\)+  skip=+\\\%(\z1\|$\)+  end=+\z1\|$+  contains=jsSpecial,@Spell extend skipwhite skipempty nextgroup=jsFuncArgs,jsObjectValue

" Statement Keywords
syntax match   jsBlockLabel              /\<\K\k*\s*::\@!/    contains=jsNoise skipwhite skipempty nextgroup=jsBlock
syntax match   jsBlockLabelKey contained /\<\K\k*\ze\s*\_[;]/
syntax keyword jsStatement     contained with yield debugger
syntax keyword jsStatement     contained break continue skipwhite skipempty nextgroup=jsBlockLabelKey
syntax keyword jsConditional            if              skipwhite skipempty nextgroup=jsParenIfElse
syntax keyword jsConditional            else            skipwhite skipempty nextgroup=jsCommentIfElse,jsIfElseBlock
syntax keyword jsConditional            switch          skipwhite skipempty nextgroup=jsParenSwitch
syntax keyword jsRepeat                 while for       skipwhite skipempty nextgroup=jsParenRepeat,jsForAwait
syntax keyword jsDo                     do              skipwhite skipempty nextgroup=jsRepeatBlock
syntax region  jsSwitchCase   contained matchgroup=jsLabel start=/\<\%(case\|default\)\>/ end=/:\@=/ contains=@jsExpression,jsLabel skipwhite skipempty nextgroup=jsSwitchColon keepend
syntax keyword jsTry                    try             skipwhite skipempty nextgroup=jsTryCatchBlock
syntax keyword jsFinally      contained finally         skipwhite skipempty nextgroup=jsFinallyBlock
syntax keyword jsCatch        contained catch           skipwhite skipempty nextgroup=jsParenCatch
syntax keyword jsException              throw
syntax keyword jsAsyncKeyword           async await
syntax match   jsSwitchColon   contained /::\@!/        skipwhite skipempty nextgroup=jsSwitchBlock

" Keywords
syntax keyword jsGlobalObjects      Array Boolean Date Function Iterator Number Object Symbol Map WeakMap Set WeakSet RegExp String Proxy Promise Buffer ParallelArray ArrayBuffer DataView Float32Array Float64Array Int16Array Int32Array Int8Array Uint16Array Uint32Array Uint8Array Uint8ClampedArray JSON Math console document window Intl Collator DateTimeFormat NumberFormat fetch
syntax keyword jsGlobalNodeObjects  module exports global process __dirname __filename
syntax match   jsGlobalNodeObjects  /\<require\>/ containedin=jsFuncCall
syntax keyword jsExceptions         Error EvalError InternalError RangeError ReferenceError StopIteration SyntaxError TypeError URIError
syntax keyword jsBuiltins           decodeURI decodeURIComponent encodeURI encodeURIComponent eval isFinite isNaN parseFloat parseInt uneval
syntax keyword jsFutureKeys         abstract enum int short boolean interface byte long char final native synchronized float package throws goto private transient implements protected volatile double public

" DOM2 Objects
syntax keyword jsGlobalObjects  DOMImplementation DocumentFragment Document Node NodeList NamedNodeMap CharacterData Attr Element Text Comment CDATASection DocumentType Notation Entity EntityReference ProcessingInstruction
syntax keyword jsExceptions     DOMException

" DOM2 CONSTANT
syntax keyword jsDomErrNo       INDEX_SIZE_ERR DOMSTRING_SIZE_ERR HIERARCHY_REQUEST_ERR WRONG_DOCUMENT_ERR INVALID_CHARACTER_ERR NO_DATA_ALLOWED_ERR NO_MODIFICATION_ALLOWED_ERR NOT_FOUND_ERR NOT_SUPPORTED_ERR INUSE_ATTRIBUTE_ERR INVALID_STATE_ERR SYNTAX_ERR INVALID_MODIFICATION_ERR NAMESPACE_ERR INVALID_ACCESS_ERR
syntax keyword jsDomNodeConsts  ELEMENT_NODE ATTRIBUTE_NODE TEXT_NODE CDATA_SECTION_NODE ENTITY_REFERENCE_NODE ENTITY_NODE PROCESSING_INSTRUCTION_NODE COMMENT_NODE DOCUMENT_NODE DOCUMENT_TYPE_NODE DOCUMENT_FRAGMENT_NODE NOTATION_NODE

" HTML events and internal variables
syntax keyword jsHtmlEvents     onblur onclick oncontextmenu ondblclick onfocus onkeydown onkeypress onkeyup onmousedown onmousemove onmouseout onmouseover onmouseup onresize

" Code blocks
syntax region  jsBracket                      matchgroup=jsBrackets            start=/\[/ end=/\]/ contains=@jsExpression,jsSpreadExpression extend fold
syntax region  jsParen                        matchgroup=jsParens              start=/(/  end=/)/  contains=@jsExpression extend fold nextgroup=jsFlowDefinition
syntax region  jsParenDecorator     contained matchgroup=jsParensDecorator     start=/(/  end=/)/  contains=@jsAll extend fold
syntax region  jsParenIfElse        contained matchgroup=jsParensIfElse        start=/(/  end=/)/  contains=@jsAll skipwhite skipempty nextgroup=jsCommentIfElse,jsIfElseBlock extend fold
syntax region  jsParenRepeat        contained matchgroup=jsParensRepeat        start=/(/  end=/)/  contains=@jsAll skipwhite skipempty nextgroup=jsCommentRepeat,jsRepeatBlock extend fold
syntax region  jsParenSwitch        contained matchgroup=jsParensSwitch        start=/(/  end=/)/  contains=@jsAll skipwhite skipempty nextgroup=jsSwitchBlock extend fold
syntax region  jsParenCatch         contained matchgroup=jsParensCatch         start=/(/  end=/)/  skipwhite skipempty nextgroup=jsTryCatchBlock extend fold
syntax region  jsFuncArgs           contained matchgroup=jsFuncParens          start=/(/  end=/)/  contains=jsFuncArgCommas,jsComment,jsFuncArgExpression,jsDestructuringBlock,jsDestructuringArray,jsRestExpression,jsFlowArgumentDef skipwhite skipempty nextgroup=jsCommentFunction,jsFuncBlock,jsFlowReturn extend fold
syntax region  jsClassBlock         contained matchgroup=jsClassBraces         start=/{/  end=/}/  contains=jsClassFuncName,jsClassMethodType,jsArrowFunction,jsArrowFuncArgs,jsComment,jsGenerator,jsDecorator,jsClassProperty,jsClassPropertyComputed,jsClassStringKey,jsAsyncKeyword,jsNoise extend fold
syntax region  jsFuncBlock          contained matchgroup=jsFuncBraces          start=/{/  end=/}/  contains=@jsAll,jsBlock extend fold
syntax region  jsIfElseBlock        contained matchgroup=jsIfElseBraces        start=/{/  end=/}/  contains=@jsAll,jsBlock extend fold
syntax region  jsTryCatchBlock      contained matchgroup=jsTryCatchBraces      start=/{/  end=/}/  contains=@jsAll,jsBlock skipwhite skipempty nextgroup=jsCatch,jsFinally extend fold
syntax region  jsFinallyBlock       contained matchgroup=jsFinallyBraces       start=/{/  end=/}/  contains=@jsAll,jsBlock extend fold
syntax region  jsSwitchBlock        contained matchgroup=jsSwitchBraces        start=/{/  end=/}/  contains=@jsAll,jsBlock,jsSwitchCase extend fold
syntax region  jsRepeatBlock        contained matchgroup=jsRepeatBraces        start=/{/  end=/}/  contains=@jsAll,jsBlock extend fold
syntax region  jsDestructuringBlock contained matchgroup=jsDestructuringBraces start=/{/  end=/}/  contains=jsDestructuringProperty,jsDestructuringAssignment,jsDestructuringNoise,jsDestructuringPropertyComputed,jsSpreadExpression,jsComment extend fold
syntax region  jsDestructuringArray contained matchgroup=jsDestructuringBraces start=/\[/ end=/\]/ contains=jsDestructuringPropertyValue,jsNoise,jsDestructuringProperty,jsSpreadExpression,jsDestructuringBlock,jsComment extend fold
syntax region  jsObject             contained matchgroup=jsObjectBraces        start=/{/  end=/}/  contains=jsObjectKey,jsObjectKeyString,jsObjectKeyComputed,jsObjectSeparator,jsObjectFuncName,jsObjectMethodType,jsGenerator,jsComment,jsObjectStringKey,jsSpreadExpression,jsDecorator,jsAsyncKeyword extend fold
syntax region  jsBlock                        matchgroup=jsBraces              start=/{/  end=/}/  contains=@jsAll,jsSpreadExpression extend fold
syntax region  jsModuleGroup        contained matchgroup=jsModuleBraces        start=/{/ end=/}/   contains=jsModuleKeyword,jsModuleComma,jsModuleAs,jsComment,jsFlowTypeKeyword skipwhite skipempty nextgroup=jsFrom fold
syntax region  jsSpreadExpression   contained matchgroup=jsSpreadOperator      start=/\.\.\./ end=/[,}\]]\@=/ contains=@jsExpression
syntax region  jsRestExpression     contained matchgroup=jsRestOperator        start=/\.\.\./ end=/[,)]\@=/
syntax region  jsTernaryIf                    matchgroup=jsTernaryIfOperator   start=/?/  end=/\%(:\|}\@=\)/  contains=@jsExpression extend skipwhite skipempty nextgroup=@jsExpression
syntax match   jsOperator       /?\.\ze\_D/

syntax match   jsGenerator            contained /\*/ skipwhite skipempty nextgroup=jsFuncName,jsFuncArgs,jsFlowFunctionGroup
syntax match   jsFuncName             contained /\<\K\k*/ skipwhite skipempty nextgroup=jsFuncArgs,jsFlowFunctionGroup
syntax region  jsFuncArgExpression    contained matchgroup=jsFuncArgOperator start=/=/ end=/[,)]\@=/ contains=@jsExpression extend
syntax match   jsFuncArgCommas        contained ','
syntax keyword jsArguments            contained arguments
syntax keyword jsForAwait             contained await skipwhite skipempty nextgroup=jsParenRepeat

" Matches a single keyword argument with no parens
syntax match   jsArrowFuncArgs  /\<\K\k*\ze\s*=>/ skipwhite contains=jsFuncArgs skipwhite skipempty nextgroup=jsArrowFunction extend
" Matches a series of arguments surrounded in parens
syntax match   jsArrowFuncArgs  /([^()]*)\ze\s*=>/ contains=jsFuncArgs skipempty skipwhite nextgroup=jsArrowFunction extend

" Classes
syntax keyword jsClassKeyword           contained class
syntax keyword jsExtendsKeyword         contained extends skipwhite skipempty nextgroup=@jsExpression
syntax match   jsClassNoise             contained /\./
syntax match   jsClassFuncName          contained /\<\K\k*\ze\s*[(<]/ skipwhite skipempty nextgroup=jsFuncArgs,jsFlowClassFunctionGroup
syntax match   jsClassMethodType        contained /\<\%([gs]et\|static\)\ze\s\+\K\k*/ skipwhite skipempty nextgroup=jsAsyncKeyword,jsClassFuncName,jsClassProperty
syntax region  jsClassDefinition                  start=/\<class\>/ end=/\(\<extends\>\s\+\)\@<!{\@=/ contains=jsClassKeyword,jsExtendsKeyword,jsClassNoise,@jsExpression,jsFlowClassGroup skipwhite skipempty nextgroup=jsCommentClass,jsClassBlock,jsFlowClassGroup
syntax match   jsClassProperty          contained /\<\K\k*\ze\s*=/ skipwhite skipempty nextgroup=jsClassValue,jsFlowClassDef
syntax region  jsClassValue             contained start=/=/ end=/\_[;}]\@=/ contains=@jsExpression
syntax region  jsClassPropertyComputed  contained matchgroup=jsBrackets start=/\[/ end=/]/ contains=@jsExpression skipwhite skipempty nextgroup=jsFuncArgs,jsClassValue extend
syntax region  jsClassStringKey         contained start=+\z(["']\)+  skip=+\\\%(\z1\|$\)+  end=+\z1\|$+  contains=jsSpecial,@Spell extend skipwhite skipempty nextgroup=jsFuncArgs

" Destructuring
syntax match   jsDestructuringPropertyValue     contained /\k\+/
syntax match   jsDestructuringProperty          contained /\k\+\ze\s*=/ skipwhite skipempty nextgroup=jsDestructuringValue
syntax match   jsDestructuringAssignment        contained /\k\+\ze\s*:/ skipwhite skipempty nextgroup=jsDestructuringValueAssignment
syntax region  jsDestructuringValue             contained start=/=/ end=/[,}\]]\@=/ contains=@jsExpression extend
syntax region  jsDestructuringValueAssignment   contained start=/:/ end=/[,}=]\@=/ contains=jsDestructuringPropertyValue,jsDestructuringBlock,jsNoise,jsDestructuringNoise skipwhite skipempty nextgroup=jsDestructuringValue extend
syntax match   jsDestructuringNoise             contained /[,[\]]/
syntax region  jsDestructuringPropertyComputed  contained matchgroup=jsDestructuringBraces start=/\[/ end=/]/ contains=@jsExpression skipwhite skipempty nextgroup=jsDestructuringValue,jsDestructuringValueAssignment,jsDestructuringNoise extend fold

" Comments
syntax keyword jsCommentTodo    contained TODO FIXME XXX TBD
syntax region  jsComment        start=+//+ end=/$/ contains=jsCommentTodo,@Spell extend keepend
syntax region  jsComment        start=+/\*+  end=+\*/+ contains=jsCommentTodo,@Spell fold extend keepend
syntax region  jsEnvComment     start=/\%^#!/ end=/$/ display

" Specialized Comments - These are special comment regexes that are used in
" odd places that maintain the proper nextgroup functionality. It sucks we
" can't make jsComment a skippable type of group for nextgroup
syntax region  jsCommentFunction    contained start=+//+ end=/$/    contains=jsCommentTodo,@Spell skipwhite skipempty nextgroup=jsFuncBlock,jsFlowReturn extend keepend
syntax region  jsCommentFunction    contained start=+/\*+ end=+\*/+ contains=jsCommentTodo,@Spell skipwhite skipempty nextgroup=jsFuncBlock,jsFlowReturn fold extend keepend
syntax region  jsCommentClass       contained start=+//+ end=/$/    contains=jsCommentTodo,@Spell skipwhite skipempty nextgroup=jsClassBlock,jsFlowClassGroup extend keepend
syntax region  jsCommentClass       contained start=+/\*+ end=+\*/+ contains=jsCommentTodo,@Spell skipwhite skipempty nextgroup=jsClassBlock,jsFlowClassGroup fold extend keepend
syntax region  jsCommentIfElse      contained start=+//+ end=/$/    contains=jsCommentTodo,@Spell skipwhite skipempty nextgroup=jsIfElseBlock extend keepend
syntax region  jsCommentIfElse      contained start=+/\*+ end=+\*/+ contains=jsCommentTodo,@Spell skipwhite skipempty nextgroup=jsIfElseBlock fold extend keepend
syntax region  jsCommentRepeat      contained start=+//+ end=/$/    contains=jsCommentTodo,@Spell skipwhite skipempty nextgroup=jsRepeatBlock extend keepend
syntax region  jsCommentRepeat      contained start=+/\*+ end=+\*/+ contains=jsCommentTodo,@Spell skipwhite skipempty nextgroup=jsRepeatBlock fold extend keepend

" Decorators
syntax match   jsDecorator                    /^\s*@/ nextgroup=jsDecoratorFunction
syntax match   jsDecoratorFunction  contained /\h[a-zA-Z0-9_.]*/ nextgroup=jsParenDecorator

syntax cluster jsExpression  contains=jsBracket,jsParen,jsObject,jsTernaryIf,jsTaggedTemplate,jsTemplateString,jsString,jsRegexpString,jsNumber,jsFloat,jsOperator,jsOperatorKeyword,jsBooleanTrue,jsBooleanFalse,jsNull,jsFunction,jsArrowFunction,jsGlobalObjects,jsExceptions,jsFutureKeys,jsDomErrNo,jsDomNodeConsts,jsHtmlEvents,jsFuncCall,jsUndefined,jsNan,jsPrototype,jsBuiltins,jsNoise,jsClassDefinition,jsArrowFunction,jsArrowFuncArgs,jsParensError,jsComment,jsArguments,jsThis,jsSuper,jsDo,jsForAwait,jsAsyncKeyword,jsStatement
syntax cluster jsAll         contains=@jsExpression,jsStorageClass,jsConditional,jsRepeat,jsReturn,jsException,jsTry,jsNoise,jsBlockLabel

highlight def link jsComment              Comment
highlight def link jsEnvComment           PreProc
highlight def link jsParensIfElse         jsParens
highlight def link jsParensRepeat         jsParens
highlight def link jsParensSwitch         jsParens
highlight def link jsParensCatch          jsParens
highlight def link jsCommentTodo          Todo
highlight def link jsString               String
highlight def link jsObjectKeyString      String
highlight def link jsTemplateString       String
highlight def link jsObjectStringKey      String
highlight def link jsClassStringKey       String
highlight def link jsTaggedTemplate       StorageClass
highlight def link jsTernaryIfOperator    Operator
highlight def link jsRegexpString         String
highlight def link jsRegexpBoundary       SpecialChar
highlight def link jsRegexpQuantifier     SpecialChar
highlight def link jsRegexpOr             Conditional
highlight def link jsRegexpMod            SpecialChar
highlight def link jsRegexpBackRef        SpecialChar
highlight def link jsRegexpGroup          jsRegexpString
highlight def link jsRegexpCharClass      Character
highlight def link jsCharacter            Character
highlight def link jsPrototype            Special
highlight def link jsConditional          Conditional
highlight def link jsBranch               Conditional
highlight def link jsLabel                Label
highlight def link jsReturn               Statement
highlight def link jsRepeat               Repeat
highlight def link jsDo                   Repeat
highlight def link jsStatement            Statement
highlight def link jsException            Exception
highlight def link jsTry                  Exception
highlight def link jsFinally              Exception
highlight def link jsCatch                Exception
highlight def link jsAsyncKeyword         Keyword
highlight def link jsForAwait             Keyword
highlight def link jsArrowFunction        Type
highlight def link jsFunction             Type
highlight def link jsGenerator            jsFunction
highlight def link jsArrowFuncArgs        jsFuncArgs
highlight def link jsFuncName             Function
highlight def link jsClassFuncName        jsFuncName
highlight def link jsObjectFuncName       Function
highlight def link jsArguments            Special
highlight def link jsError                Error
highlight def link jsParensError          Error
highlight def link jsOperatorKeyword      jsOperator
highlight def link jsOperator             Operator
highlight def link jsOf                   Operator
highlight def link jsStorageClass         StorageClass
highlight def link jsClassKeyword         Keyword
highlight def link jsExtendsKeyword       Keyword
highlight def link jsThis                 Special
highlight def link jsSuper                Constant
highlight def link jsNan                  Number
highlight def link jsNull                 Type
highlight def link jsUndefined            Type
highlight def link jsNumber               Number
highlight def link jsFloat                Float
highlight def link jsBooleanTrue          Boolean
highlight def link jsBooleanFalse         Boolean
highlight def link jsObjectColon          jsNoise
highlight def link jsNoise                Noise
highlight def link jsBrackets             Noise
highlight def link jsParens               Noise
highlight def link jsBraces               Noise
highlight def link jsFuncBraces           Noise
highlight def link jsFuncParens           Noise
highlight def link jsClassBraces          Noise
highlight def link jsClassNoise           Noise
highlight def link jsIfElseBraces         Noise
highlight def link jsTryCatchBraces       Noise
highlight def link jsModuleBraces         Noise
highlight def link jsObjectBraces         Noise
highlight def link jsObjectSeparator      Noise
highlight def link jsFinallyBraces        Noise
highlight def link jsRepeatBraces         Noise
highlight def link jsSwitchBraces         Noise
highlight def link jsSpecial              Special
highlight def link jsTemplateBraces       Noise
highlight def link jsGlobalObjects        Constant
highlight def link jsGlobalNodeObjects    Constant
highlight def link jsExceptions           Constant
highlight def link jsBuiltins             Constant
highlight def link jsImport               Include
highlight def link jsExport               Include
highlight def link jsExportDefault        StorageClass
highlight def link jsExportDefaultGroup   jsExportDefault
highlight def link jsModuleAs             Include
highlight def link jsModuleComma          jsNoise
highlight def link jsModuleAsterisk       Noise
highlight def link jsFrom                 Include
highlight def link jsDecorator            Special
highlight def link jsDecoratorFunction    Function
highlight def link jsParensDecorator      jsParens
highlight def link jsFuncArgOperator      jsFuncArgs
highlight def link jsClassProperty        jsObjectKey
highlight def link jsSpreadOperator       Operator
highlight def link jsRestOperator         Operator
highlight def link jsRestExpression       jsFuncArgs
highlight def link jsSwitchColon          Noise
highlight def link jsClassMethodType      Type
highlight def link jsObjectMethodType     Type
highlight def link jsClassDefinition      jsFuncName
highlight def link jsBlockLabel           Identifier
highlight def link jsBlockLabelKey        jsBlockLabel

highlight def link jsDestructuringBraces     Noise
highlight def link jsDestructuringProperty   jsFuncArgs
highlight def link jsDestructuringAssignment jsObjectKey
highlight def link jsDestructuringNoise      Noise

highlight def link jsCommentFunction      jsComment
highlight def link jsCommentClass         jsComment
highlight def link jsCommentIfElse        jsComment
highlight def link jsCommentRepeat        jsComment

highlight def link jsDomErrNo             Constant
highlight def link jsDomNodeConsts        Constant
highlight def link jsDomElemAttrs         Label
highlight def link jsDomElemFuncs         PreProc

highlight def link jsHtmlEvents           Special
highlight def link jsHtmlElemAttrs        Label
highlight def link jsHtmlElemFuncs        PreProc

highlight def link jsCssStyles            Label

" Define the htmlJavaScript for HTML syntax html.vim
syntax cluster  htmlJavaScript       contains=@jsAll,jsImport,jsExport
syntax cluster  javaScriptExpression contains=@jsAll

" Vim's default html.vim highlights all javascript as 'Special'
highlight! def link javaScript              NONE
