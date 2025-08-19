; extends

(
  ([
    (list_marker_star)
    (list_marker_plus)
    (list_marker_minus)
  ]) @markdown_list_marker
  (#offset! @markdown_list_marker 0 0 0 -1)
  (#set! conceal "•")
)

((task_list_marker_unchecked) @markdown_check_undone (#set! conceal "󰄱"))
((task_list_marker_checked) @markdown_check_done (#set! conceal ""))
