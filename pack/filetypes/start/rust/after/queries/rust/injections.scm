; extends
(
 (line_comment) @_code_block_delimiter
 (_) @rust
 (line_comment) @_last
 (#match? @_code_block_delimiter "^/// ```$")
 (#offset! @rust 0 4 0 4)
)
