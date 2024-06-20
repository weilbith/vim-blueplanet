(
 ([
   (declaration)
  ] @_start @_end)
 (#make-range! "range" @_start @_end)
)

(
 (block . "{" . (_) @_start @_end (_)? @_end . "}" . )
 (#make-range! "range" @_start @_end)
)

(
 ([
   (rule_set)
   (block)
  ] @_start @_end)
 (#make-range! "range" @_start @_end)
)
