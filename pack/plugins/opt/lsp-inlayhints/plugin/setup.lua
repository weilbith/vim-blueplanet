require('lsp-inlayhints').setup({
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
