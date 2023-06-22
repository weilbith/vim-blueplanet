local circular_numbers = { '❶', '❷', '❸', '❹', '❺', '❻', '❼', '❽', '❾' }

local function number_to_circular_number(_, index)
  return (circular_numbers[index] or index) .. ' '
end

require('vim.diagnostic').config({
  underline = true,
  update_in_insert = true,
  virtual_text = {
    severity = vim.diagnostic.severity.ERROR,
  },
  float = {
    show_header = true,
    source = true,
    prefix = number_to_circular_number,
  },
})
