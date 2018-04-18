  syntax keyword Boolean true false NULL TRUE FALSE
  syntax keyword Type null Object byte char Character String boolean Boolean
  syntax keyword Type int Integer long Long float Float double Double String
  syntax keyword Type Array List ArrayList Map HashMap
  syntax keyword Type File Pair
  syntax keyword Operator try catch switch case
  
  
  syntax match _Block "[{}]"
  syntax match _Bracket "[\[\]]"
  syntax match _Object "\w*\ze\s*=" " Object assignment.
  syntax match _Object "\s\zs\w*\ze\." " Access objects property.
  syntax match _Property "\.\zs\w*" " Before the function definition. 
  syntax match _Function "\zs\(\k\w*\)*\s*\ze("
  syntax match _Operator "[-+&|<>=!\/~,;:*%&^?()]" " Define this after the function pattern, so the parenthesis are colored correctly.
  syntax match _Comment "\/\/.*$" " Define this after the operator pattern, cause else it does not work.
  syntax region _Comment start="\/\*" end="\*\/" contains=_CommentKey
  syntax match _CommentKey "^\s*\*\s*\zs@\w*\ze\s" contained nextgroup=_CommentValue
  syntax match _CommentValue ".*$" contained
 
  highlight link _Block Operator
  highlight link _Bracket Operator
  highlight link _Object Statement
  highlight _Property ctermfg=87 guifg=#5fffff
  highlight link _Function Function
  highlight link _Operator Operator
  highlight link _Comment Comment
  highlight link _CommentKey Special
  highlight link _CommentValue Constant
