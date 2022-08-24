require('lsp-inlayhints').setup({
  enabled_at_startup = true,
  inlay_hints = {
    parameter_hints = {
      prefix = ' ',
      separator = '  ',
    },
    type_hints = {
      prefix = '  ',
      separator = '  ',
    },
    labels_separator = ' ',
  },
})
