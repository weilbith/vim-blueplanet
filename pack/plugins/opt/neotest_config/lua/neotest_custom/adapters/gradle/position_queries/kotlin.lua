local plain_class = [[
    (
      (class_declaration (type_identifier) @namespace.name)
    ) @namespace.definition
  ]]

local function_with_test_marker = [[
    (
      (function_declaration
        (modifiers (annotation (user_type (type_identifier) @test_marker.identifier)))
        (simple_identifier) @test.name
      )
      (#eq? @test_marker.identifier "Test")
    ) @test.definition
  ]]

local function_with_test_marker_and_display_name_annotation = [[
    (
      (function_declaration
        (modifiers
          (annotation (user_type (type_identifier) @test_marker.identifier))
          (annotation
            (constructor_invocation
              (user_type (type_identifier) @display_name.identifier)
              (value_arguments (value_argument (string_literal) @display_name.value))
            )
          )
        )
        (simple_identifier) @test.name
      )
      (#eq? @test_marker.identifier "Test")
      (#eq? @display_name.identifier "DisplayName")
    ) @test.definition
  ]]

return plain_class
  .. function_with_test_marker_and_display_name_annotation
  .. function_with_test_marker
