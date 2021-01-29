lua packer.use({
    \   'glepnir/lspsaga.nvim',
    \   cmd = {
		\     'LspSagaDefPreview',
		\     'LspSagaFinder',
		\     'LspRename',
		\     'LspSagaCodeAction',
		\     'LspSagaRangeCodeAction',
		\			'LspSagaShowLineDiags',
		\     'LspSagaDiagJumpNext',
		\     'LspSagaDiagJumpPrev',
		\   },
    \   config = 'vim.cmd("packadd lspsaga")',
    \ })

" TODO: Add lazy loading once PR is merged.
