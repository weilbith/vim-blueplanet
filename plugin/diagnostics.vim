scriptencoding utf-8

sign define LspDiagnosticsSignError       text=✖
sign define LspDiagnosticsSignWarning     text=
sign define LspDiagnosticsSignInformation text=
sign define LspDiagnosticsSignHint        text=

highlight! link LspDiagnosticsDefaultError        Red
highlight! link LspDiagnosticsDefaultWarning      Orange
highlight! link LspDiagnosticsDefaultInformation  Yellow
highlight! link LspDiagnosticsDefaultHint         Blue
highlight! link LspDiagnosticsSignError           RedBold
highlight! link LspDiagnosticsSignWarning         OrangeBold
highlight! link LspDiagnosticsSignInformation     YellowBold
highlight! link LspDiagnosticsSignHint            BlueBold

nnoremap ]d <cmd>lua vim.lsp.diagnostic.goto_next({ wrap = false })<CR>
nnoremap [d <cmd>lua vim.lsp.diagnostic.goto_prev({ wrap = false })<CR>

lua require('lsp.handler.diagnostics').setup()

augroup Diagnostics
  autocmd!
  autocmd User LspDiagnosticsChanged lua vim.lsp.diagnostic.set_loclist({ open_loclist = false})
augroup END
