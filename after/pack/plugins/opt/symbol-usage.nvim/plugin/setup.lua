local SymbolKind = vim.lsp.protocol.SymbolKind
local format_lens = require('symbol-usage.custom').format_lens

require('symbol-usage').setup({
  hl = { link = 'LspCodeLens' },
  text_format = format_lens,
  definition = {
    enabled = false,
  },
  implementation = {
    enabled = true,
    kinds = { SymbolKind.Interface },
  },
  references = {
    enabled = true,
    kinds = {
      SymbolKind.Class,
      SymbolKind.Interface,
      SymbolKind.Enum,
      SymbolKind.EnumMember,
      SymbolKind.Function,
      SymbolKind.Method,
    },
  },
  filetypes = {
    -- Conflicts with Rusts language server lenses which are better.
    rust = {
      definition = { enabled = false },
      implementation = { enabled = false },
      references = { enabled = false },
    },
  },
})
