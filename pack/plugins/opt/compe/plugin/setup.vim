set completeopt=menu,menuone,noselect

lua require('compe').setup({
      \   source = {
      \     path = true,
      \     calc = true,
      \     nvim_lsp = true,
      \     nvim_lua = true,
      \     ultisnips = true,
      \     treesitter = false,
      \     tags = false,
      \     vsnip = false,
      \     spell = false,
      \     buffer = false,
      \     snippets_nvim = false,
      \   },
      \ })

" TODO: Enable Treesitter when it does not slow-down everything.
