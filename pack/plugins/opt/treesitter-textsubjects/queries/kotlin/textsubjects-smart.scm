(
  (
    [
      (import_list)
      (import_header)
      (class_declaration)
      (companion_object)
      (anonymous_initializer)
      (property_declaration)
      (getter)
      (object_literal)
      (function_declaration)
      (property_declaration)
      (for_statement)
      (while_statement)
      (do_while_statement)
      (if_expression)
      (when_condition)
      (when_entry)
      (when_expression)
      (control_structure_body)
      (collection_literal)
      (assignment)
      (call_suffix)
      (call_expression)
      (line_comment)
      (multiline_comment)
    ]
    @_start @_end
  )
  (#make-range! "range" @_start @_end)
)

(
 (collection_literal (_) @_start @_end . ","? @_end)
 (#make-range! "range" @_start @_end)
)

(
  (function_value_parameters (parameter) @_start @_end . ","? @_end)
  (#make-range! "range" @_start @_end)
)

(
  (value_arguments (value_argument) @_start @_end . ","? @_end)
  (#make-range! "range" @_start @_end)
)

(
  ((class_parameter) @_start @_end . ","? @_end)
  (#make-range! "range" @_start @_end)
)

; TODO: Not working
(
  (class_body . "{" . (_) @_start @_end . "}")
  (#make-range! "range" @_start @_end)
)

; TODO: Not working
(
  (enum_class_body . "{" . (_) @_start @_end . "}")
  (#make-range! "range" @_start @_end)
)

(
  (function_body . "{" . (_) @_start @_end . "}")
  (#make-range! "range" @_start @_end)
)
