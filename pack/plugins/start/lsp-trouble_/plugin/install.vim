lua packer.use({
      \   'folke/lsp-trouble.nvim',
      \   cmd = 'LspTroubleToggle',
      \   event = 'User LspDiagnosticsChanged',
      \   config = 'vim.cmd("packadd lsp-trouble")',
      \ })
