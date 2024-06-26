local filetype_provider_mapping = {
  yaml = { 'treesitter', 'indent' },
  ['neo-tree'] = '',
  ['Outline'] = '',
}

require('ufo').setup({
  close_fold_kinds_for_ft = {
    default = { default = { 'imports', 'comment' } },
  },
  provider_selector = function(_, filetype)
    return filetype_provider_mapping[filetype] or { 'lsp', 'indent' }
  end,
  fold_virt_text_handler = function(fold_text, start_line_number, end_line_number)
    local line_count = end_line_number - start_line_number
    local suffix = '  󰇘 ' .. line_count .. ' lines'
    table.insert(fold_text, { suffix, 'Comment' })
    return fold_text
  end,
  preview = {
    win_config = {
      border = { '', '▔', '', '', '', '▁', '', '' },
      winhighlight = 'Normal:NormalFloat',
      winblend = 0,
    },
  },
})
