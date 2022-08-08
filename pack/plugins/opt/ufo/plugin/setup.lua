require('ufo').setup({
  provider_selector = function()
    return { 'lsp', 'indent' }
  end,
  fold_virt_text_handler = function(fold_text, start_line_number, end_line_number)
    local line_count = end_line_number - start_line_number
    local suffix = '  ' .. line_count .. ' lines '
    table.insert(fold_text, { suffix, 'Comment' })
    return fold_text
  end,
})
