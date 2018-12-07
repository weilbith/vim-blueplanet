" Vim syntax file
" Language: Python
" Acknowledgment: https://github.com/python-mode/python-mode

if exists('b:current_syntax')
  finish
endif

let b:current_syntax = 1

syntax keyword pythonStatement print
syntax keyword pythonStatement break continue del
syntax keyword pythonStatement exec return
syntax keyword pythonStatement pass raise
syntax keyword pythonStatement global nonlocal assert
syntax keyword pythonStatement yield
syntax keyword pythonLambdaExpr lambda
syntax keyword pythonStatement with as

syntax keyword pythonStatement def nextgroup=pythonFunction skipwhite
syntax match pythonFunction "\%(\%(def\s\|@\)\s*\)\@<=\h\%(\w\|\.\)*" contained nextgroup=pythonVars
syntax region pythonVars start="(" skip=+\(".*"\|'.*'\)+ end=")" contained contains=pythonParameters transparent keepend
syntax match pythonParameters "[^,]*" contained contains=pythonParam skipwhite
syntax match pythonParam "[^,]*" contained contains=pythonExtraOperator,pythonLambdaExpr,pythonBuiltinObj,pythonBuiltinType,pythonConstant,pythonString,pythonNumber,pythonBrackets,pythonSelf,pythonComment skipwhite
syntax match pythonBrackets "{[(|)]}" contained skipwhite

syntax keyword pythonStatement class nextgroup=pythonClass skipwhite
syntax match pythonClass "\%(\%(class\s\)\s*\)\@<=\h\%(\w\|\.\)*" contained nextgroup=pythonClassVars
syntax region pythonClassVars start="(" end=")" contained contains=pythonClassParameters transparent keepend
syntax match pythonClassParameters "[^,\*]*" contained contains=pythonBuiltin,pythonBuiltinObj,pythonBuiltinType,pythonExtraOperatorpythonStatement,pythonBrackets,pythonString,pythonComment skipwhite

syntax keyword pythonRepeat        for while
syntax keyword pythonConditional   if elif else
syntax keyword pythonInclude       import from
syntax keyword pythonException     try except finally
syntax keyword pythonOperator      and in is not or

syntax match pythonExtraOperator "\%([~!^&|/%+-]\|\%(class\s*\)\@<!<<\|<=>\|<=\|\%(<\|\<class\s\+\u\w*\s*\)\@<!<[^<]\@=\|===\|==\|=\~\|>>\|>=\|=\@<!>\|\.\.\.\|\.\.\|::\)"
syntax match pythonExtraPseudoOperator "\%(-=\|/=\|\*\*=\|\*=\|&&=\|&=\|&&\|||=\||=\|||\|%=\|+=\|!\~\|!=\)"

syntax keyword pythonStatement async await
syntax match pythonStatement "\<async\s\+def\>" nextgroup=pythonFunction skipwhite
syntax match pythonStatement "\<async\s\+with\>" display
syntax match pythonStatement "\<async\s\+for\>" nextgroup=pythonRepeat skipwhite

syntax match pythonExtraOperator "\%(=\)"
syntax match pythonExtraOperator "\%(\*\|\*\*\)"
syntax keyword pythonSelf self cls

syntax match   pythonDecorator  "@" display nextgroup=pythonDottedName skipwhite
syntax match   pythonDottedName "[a-zA-Z_][a-zA-Z0-9_]*\(\.[a-zA-Z_][a-zA-Z0-9_]*\)*" display contained
syntax match   pythonDot        "\." display containedin=pythonDottedName

syntax match   pythonComment   "#.*$" display contains=pythonTodo,@Spell
syntax match   pythonRun       "\%^#!.*$"
syntax match   pythonCoding    "\%^.*\(\n.*\)\?#.*coding[:=]\s*[0-9A-Za-z-_.]\+.*$"
syntax keyword pythonTodo      TODO FIXME XXX contained

syntax match pythonError       "\<\d\+\D\+\>" display
syntax match pythonError       "[$?]" display
syntax match pythonError       "[&|]\{2,}" display
syntax match pythonError       "[=]\{3,}" display

syntax match pythonIndentError "^\s*\( \t\|\t \)\s*\S"me=e-1 display
syntax match pythonSpaceError  "\s\+$" display

syntax region pythonString     start=+[bB]\='+ skip=+\\\\\|\\'\|\\$+ excludenl end=+'+ end=+$+ keepend contains=pythonEscape,pythonEscapeError,@Spell
syntax region pythonString     start=+[bB]\="+ skip=+\\\\\|\\"\|\\$+ excludenl end=+"+ end=+$+ keepend contains=pythonEscape,pythonEscapeError,@Spell
syntax region pythonString     start=+[bB]\="""+ end=+"""+ keepend contains=pythonEscape,pythonEscapeError,pythonDocTest2,pythonSpaceError,@Spell
syntax region pythonString     start=+[bB]\='''+ end=+'''+ keepend contains=pythonEscape,pythonEscapeError,pythonDocTest,pythonSpaceError,@Spell

syntax match  pythonEscape     +\\[abfnrtv'"\\]+ display contained
syntax match  pythonEscape     "\\\o\o\=\o\=" display contained
syntax match  pythonEscapeError    "\\\o\{,2}[89]" display contained
syntax match  pythonEscape     "\\x\x\{2}" display contained
syntax match  pythonEscapeError    "\\x\x\=\X" display contained
syntax match  pythonEscape     "\\$"

syntax region pythonUniString  start=+[uU]'+ skip=+\\\\\|\\'\|\\$+ excludenl end=+'+ end=+$+ keepend contains=pythonEscape,pythonUniEscape,pythonEscapeError,pythonUniEscapeError,@Spell
syntax region pythonUniString  start=+[uU]"+ skip=+\\\\\|\\"\|\\$+ excludenl end=+"+ end=+$+ keepend contains=pythonEscape,pythonUniEscape,pythonEscapeError,pythonUniEscapeError,@Spell
syntax region pythonUniString  start=+[uU]"""+ end=+"""+ keepend contains=pythonEscape,pythonUniEscape,pythonEscapeError,pythonUniEscapeError,pythonDocTest2,pythonSpaceError,@Spell
syntax region pythonUniString  start=+[uU]'''+ end=+'''+ keepend contains=pythonEscape,pythonUniEscape,pythonEscapeError,pythonUniEscapeError,pythonDocTest,pythonSpaceError,@Spell

syntax match  pythonUniEscape          "\\u\x\{4}" display contained
syntax match  pythonUniEscapeError     "\\u\x\{,3}\X" display contained
syntax match  pythonUniEscape          "\\U\x\{8}" display contained
syntax match  pythonUniEscapeError     "\\U\x\{,7}\X" display contained
syntax match  pythonUniEscape          "\\N{[A-Z ]\+}" display contained
syntax match  pythonUniEscapeError "\\N{[^A-Z ]\+}" display contained

syntax region pythonRawString  start=+[rR]'+ skip=+\\\\\|\\'\|\\$+ excludenl end=+'+ end=+$+ keepend contains=pythonRawEscape,@Spell
syntax region pythonRawString  start=+[rR]"+ skip=+\\\\\|\\"\|\\$+ excludenl end=+"+ end=+$+ keepend contains=pythonRawEscape,@Spell
syntax region pythonRawString  start=+[rR]"""+ end=+"""+ keepend contains=pythonDocTest2,pythonSpaceError,@Spell
syntax region pythonRawString  start=+[rR]'''+ end=+'''+ keepend contains=pythonDocTest,pythonSpaceError,@Spell

syntax match pythonRawEscape           +\\['"]+ display transparent contained

syntax region pythonUniRawString   start=+[uU][rR]'+ skip=+\\\\\|\\'\|\\$+ excludenl end=+'+ end=+$+ keepend contains=pythonRawEscape,pythonUniRawEscape,pythonUniRawEscapeError,@Spell
syntax region pythonUniRawString   start=+[uU][rR]"+ skip=+\\\\\|\\"\|\\$+ excludenl end=+"+ end=+$+ keepend contains=pythonRawEscape,pythonUniRawEscape,pythonUniRawEscapeError,@Spell
syntax region pythonUniRawString   start=+[uU][rR]"""+ end=+"""+ keepend contains=pythonUniRawEscape,pythonUniRawEscapeError,pythonDocTest2,pythonSpaceError,@Spell
syntax region pythonUniRawString   start=+[uU][rR]'''+ end=+'''+ keepend contains=pythonUniRawEscape,pythonUniRawEscapeError,pythonDocTest,pythonSpaceError,@Spell

syntax match  pythonUniRawEscape   "\([^\\]\(\\\\\)*\)\@<=\\u\x\{4}" display contained
syntax match  pythonUniRawEscapeError  "\([^\\]\(\\\\\)*\)\@<=\\u\x\{,3}\X" display contained

syntax match pythonStrFormatting   "%\(([^)]\+)\)\=[-#0 +]*\d*\(\.\d\+\)\=[hlL]\=[diouxXeEfFgGcrs%]" contained containedin=pythonString,pythonUniString,pythonRawString,pythonUniRawString
syntax match pythonStrFormatting   "%[-#0 +]*\(\*\|\d\+\)\=\(\.\(\*\|\d\+\)\)\=[hlL]\=[diouxXeEfFgGcrs%]" contained containedin=pythonString,pythonUniString,pythonRawString,pythonUniRawString

syntax match pythonStrFormat "{{\|}}" contained containedin=pythonString,pythonUniString,pythonRawString,pythonUniRawString
syntax match pythonStrFormat "{\([a-zA-Z0-9_]*\|\d\+\)\(\.[a-zA-Z_][a-zA-Z0-9_]*\|\[\(\d\+\|[^!:\}]\+\)\]\)*\(![rs]\)\=\(:\({\([a-zA-Z_][a-zA-Z0-9_]*\|\d\+\)}\|\([^}]\=[<>=^]\)\=[ +-]\=#\=0\=\d*\(\.\d\+\)\=[bcdeEfFgGnoxX%]\=\)\=\)\=}" contained containedin=pythonString,pythonUniString,pythonRawString,pythonUniRawString

syntax match pythonStrTemplate "\$\$" contained containedin=pythonString,pythonUniString,pythonRawString,pythonUniRawString
syntax match pythonStrTemplate "\${[a-zA-Z_][a-zA-Z0-9_]*}" contained containedin=pythonString,pythonUniString,pythonRawString,pythonUniRawString
syntax match pythonStrTemplate "\$[a-zA-Z_][a-zA-Z0-9_]*" contained containedin=pythonString,pythonUniString,pythonRawString,pythonUniRawString

syntax region pythonDocTest    start="^\s*>>>" end=+'''+he=s-1 end="^\s*$" contained
syntax region pythonDocTest2   start="^\s*>>>" end=+"""+he=s-1 end="^\s*$" contained

syntax region pythonDocstring  start=+^\s*[uU]\?[rR]\?"""+ end=+"""+ keepend excludenl contains=pythonEscape,@Spell,pythonDoctest,pythonDocTest2,pythonSpaceError
syntax region pythonDocstring  start=+^\s*[uU]\?[rR]\?'''+ end=+'''+ keepend excludenl contains=pythonEscape,@Spell,pythonDoctest,pythonDocTest2,pythonSpaceError

syntax match   pythonHexError  "\<0[xX][0-9a-fA-F_]*[g-zG-Z][0-9a-fA-F_]*[lL]\=\>" display
syntax match   pythonHexNumber "\<0[xX][0-9a-fA-F_]*[0-9a-fA-F][0-9a-fA-F_]*[lL]\=\>" display
syntax match   pythonOctNumber "\<0[oO][0-7_]*[0-7][0-7_]*[lL]\=\>" display
syntax match   pythonBinNumber "\<0[bB][01_]*[01][01_]*[lL]\=\>" display
syntax match   pythonNumber    "\<[0-9][0-9_]*[lLjJ]\=\>" display
syntax match   pythonFloat "\.[0-9_]*[0-9][0-9_]*\([eE][+-]\=[0-9_]*[0-9][0-9_]*\)\=[jJ]\=\>" display
syntax match   pythonFloat "\<[0-9][0-9_]*[eE][+-]\=[0-9_]\+[jJ]\=\>" display
syntax match   pythonFloat "\<[0-9][0-9_]*\.[0-9_]*\([eE][+-]\=[0-9_]*[0-9][0-9_]*\)\=[jJ]\=" display
syntax match   pythonOctError  "\<0[oO]\=[0-7_]*[8-9][0-9_]*[lL]\=\>" display
syntax match   pythonBinError  "\<0[bB][01_]*[2-9][0-9_]*[lL]\=\>" display

syntax keyword pythonBuiltinObj True False Ellipsis None NotImplemented
syntax keyword pythonBuiltinObj __debug__ __doc__ __file__ __name__ __package__


syntax keyword pythonBuiltinType type object
syntax keyword pythonBuiltinType str basestring unicode buffer bytearray bytes chr unichr
syntax keyword pythonBuiltinType dict int long bool float complex set frozenset list tuple
syntax keyword pythonBuiltinType file super

syntax keyword pythonBuiltinFunc   print
syntax keyword pythonBuiltinFunc   __import__ abs all any apply
syntax keyword pythonBuiltinFunc   bin callable classmethod cmp coerce compile
syntax keyword pythonBuiltinFunc   delattr dir divmod enumerate eval execfile filter
syntax keyword pythonBuiltinFunc   format getattr globals locals hasattr hash help hex id
syntax keyword pythonBuiltinFunc   input intern isinstance issubclass iter len map max min
syntax keyword pythonBuiltinFunc   next oct open ord pow property range xrange
syntax keyword pythonBuiltinFunc   raw_input reduce reload repr reversed round setattr
syntax keyword pythonBuiltinFunc   slice sorted staticmethod sum vars zip


syntax keyword pythonExClass   BaseException
syntax keyword pythonExClass   Exception StandardError ArithmeticError
syntax keyword pythonExClass   LookupError EnvironmentError
syntax keyword pythonExClass   AssertionError AttributeError BufferError EOFError
syntax keyword pythonExClass   FloatingPointError GeneratorExit IOError
syntax keyword pythonExClass   ImportError IndexError KeyError
syntax keyword pythonExClass   KeyboardInterrupt MemoryError NameError
syntax keyword pythonExClass   NotImplementedError OSError OverflowError
syntax keyword pythonExClass   ReferenceError RuntimeError StopIteration
syntax keyword pythonExClass   SyntaxError IndentationError TabError
syntax keyword pythonExClass   SystemError SystemExit TypeError
syntax keyword pythonExClass   UnboundLocalError UnicodeError
syntax keyword pythonExClass   UnicodeEncodeError UnicodeDecodeError
syntax keyword pythonExClass   UnicodeTranslateError ValueError VMSError
syntax keyword pythonExClass   BlockingIOError ChildProcessError ConnectionError
syntax keyword pythonExClass   BrokenPipeError ConnectionAbortedError
syntax keyword pythonExClass   ConnectionRefusedError ConnectionResetError
syntax keyword pythonExClass   FileExistsError FileNotFoundError InterruptedError
syntax keyword pythonExClass   IsADirectoryError NotADirectoryError PermissionError
syntax keyword pythonExClass   ProcessLookupError TimeoutError
syntax keyword pythonExClass   WindowsError ZeroDivisionError
syntax keyword pythonExClass   Warning UserWarning BytesWarning DeprecationWarning
syntax keyword pythonExClass   PendingDepricationWarning SyntaxWarning
syntax keyword pythonExClass   RuntimeWarning FutureWarning
syntax keyword pythonExClass   ImportWarning UnicodeWarning

highlight def link  pythonStatement    Statement
highlight def link  pythonLambdaExpr   Statement
highlight def link  pythonInclude      Include
highlight def link  pythonFunction     Function
highlight def link  pythonClass        Type
highlight def link  pythonParameters   Normal
highlight def link  pythonParam        Normal
highlight def link  pythonBrackets     Normal
highlight def link  pythonClassParameters Normal
highlight def link  pythonSelf         Type

highlight def link  pythonConditional  Conditional
highlight def link  pythonRepeat       Repeat
highlight def link  pythonException    Exception
highlight def link  pythonOperator     Operator
highlight def link  pythonExtraOperator        Operator
highlight def link  pythonExtraPseudoOperator  Operator

highlight def link  pythonDecorator    Define
highlight def link  pythonDottedName   Function
highlight def link  pythonDot          Normal

highlight def link  pythonComment      Comment
highlight def link  pythonCoding       Special
highlight def link  pythonRun          Special
highlight def link  pythonTodo         Todo

highlight def link  pythonError        Error
highlight def link  pythonIndentError  Error
highlight def link  pythonSpaceError   Error

highlight def link  pythonString       String
highlight def link  pythonDocstring    String
highlight def link  pythonUniString    String
highlight def link  pythonRawString    String
highlight def link  pythonUniRawString String

highlight def link  pythonEscape       Special
highlight def link  pythonEscapeError  Error
highlight def link  pythonUniEscape    Special
highlight def link  pythonUniEscapeError Error
highlight def link  pythonUniRawEscape Special
highlight def link  pythonUniRawEscapeError Error

highlight def link  pythonStrFormatting Special
highlight def link  pythonStrFormat    Special
highlight def link  pythonStrTemplate  Special

highlight def link  pythonDocTest      Special
highlight def link  pythonDocTest2     Special

highlight def link  pythonNumber       Number
highlight def link  pythonHexNumber    Number
highlight def link  pythonOctNumber    Number
highlight def link  pythonBinNumber    Number
highlight def link  pythonFloat        Float
highlight def link  pythonOctError     Error
highlight def link  pythonHexError     Error
highlight def link  pythonBinError     Error

highlight def link  pythonBuiltinType  Type
highlight def link  pythonBuiltinObj   Structure
highlight def link  pythonBuiltinFunc  Function

highlight def link  pythonExClass      Structure
