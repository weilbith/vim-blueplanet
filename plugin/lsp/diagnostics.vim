scriptencoding utf-8

sign define LspDiagnosticsSignError       text=✖
sign define LspDiagnosticsSignWarning     text=
sign define LspDiagnosticsSignInformation text=
sign define LspDiagnosticsSignHint        text=

lua << EOF
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    underline = false,
    virtual_text = { spacing = 8 },
  }
)
EOF
