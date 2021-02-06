lua packer.use({
		\   'Raimondi/delimitMate',
		\   event = 'InsertEnter *',
		\   config = 'vim.cmd("packadd delimitmate | DelimitMateReload")',
		\ })
