" Vim syntax file
" Language:   TOML
" Source: https://github.com/cespare/vim-toml/blob/master/syntax/toml.vim

if exists('b:current_syntax')
  finish
endif

syn match tomlEscape /\\[btnfr"/\\]/ display contained
syn match tomlEscape /\\u\x\{4}/ contained
syn match tomlEscape /\\U\x\{8}/ contained
highlight def link tomlEscape SpecialChar

syn match tomlLineEscape /\\$/ contained
highlight def link tomlLineEscape SpecialChar

" Basic strings
syn region tomlString oneline start=/"/ skip=/\\\\\|\\"/ end=/"/ contains=tomlEscape
" Multi-line basic strings
syn region tomlString start=/"""/ end=/"""/ contains=tomlEscape,tomlLineEscape
" Literal strings
syn region tomlString oneline start=/'/ end=/'/
" Multi-line literal strings
syn region tomlString start=/'''/ end=/'''/
highlight def link tomlString String

syn match tomlInteger /[+-]\=\<[1-9]\(_\=\d\)*\>/ display
syn match tomlInteger /[+-]\=\<0\>/ display
syn match tomlInteger /[+-]\=\<0x[[:xdigit:]]\(_\=[[:xdigit:]]\)*\>/ display
syn match tomlInteger /[+-]\=\<0o[0-7]\(_\=[0-7]\)*\>/ display
syn match tomlInteger /[+-]\=\<0b[01]\(_\=[01]\)*\>/ display
syn match tomlInteger /[+-]\=\<\(inf\|nan\)\>/ display
highlight def link tomlInteger Number

syn match tomlFloat /[+-]\=\<\d\(_\=\d\)*\.\d\+\>/ display
syn match tomlFloat /[+-]\=\<\d\(_\=\d\)*\(\.\d\(_\=\d\)*\)\=[eE][+-]\=\d\(_\=\d\)*\>/ display
highlight def link tomlFloat Float

syn match tomlBoolean /\<\%(true\|false\)\>/ display
highlight def link tomlBoolean Boolean

syn match tomlDate /\d\{4\}-\d\{2\}-\d\{2\}/ display
syn match tomlDate /\d\{2\}:\d\{2\}:\d\{2\}\%(\.\d\+\)\?/ display
syn match tomlDate /\d\{4\}-\d\{2\}-\d\{2\}[T ]\d\{2\}:\d\{2\}:\d\{2\}\%(\.\d\+\)\?\%(Z\|[+-]\d\{2\}:\d\{2\}\)\?/ display
highlight def link tomlDate Constant

syn match tomlKey /\v(^|[{,])\s*\zs[[:alnum:]_-]+\ze\s*\=/ display
highlight def link tomlKey Identifier

syn region tomlKeyDq oneline start=/\v(^|[{,])\s*\zs"/ end=/"\ze\s*=/ contains=tomlEscape
highlight def link tomlKeyDq Identifier

syn region tomlKeySq oneline start=/\v(^|[{,])\s*\zs'/ end=/'\ze\s*=/
highlight def link tomlKeySq Identifier

syn region tomlTable oneline start=/^\s*\[[^\[]/ end=/\]/ contains=tomlKey,tomlKeyDq,tomlKeySq
highlight def link tomlTable Identifier

syn region tomlTableArray oneline start=/^\s*\[\[/ end=/\]\]/ contains=tomlKey,tomlKeyDq,tomlKeySq
highlight def link tomlTableArray Identifier

syn keyword tomlTodo TODO FIXME XXX BUG contained
highlight def link tomlTodo Todo

syn match tomlComment /#.*/ contains=@Spell,tomlTodo
highlight def link tomlComment Comment

syn sync minlines=500

let b:current_syntax = 'toml'
