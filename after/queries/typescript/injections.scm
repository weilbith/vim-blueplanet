; extends

; Control language injection via comment in front of string.
; E.g.: `/* html */ "<h1>header</h1>"`
(variable_declarator
	(comment) @injection.language (#offset! @injection.language 0 3 0 -3)
	(string (string_fragment) @injection.content)
)
