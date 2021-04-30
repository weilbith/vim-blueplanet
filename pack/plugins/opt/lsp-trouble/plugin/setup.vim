lua require("trouble").setup({
      \   fold_open = "",
      \   fold_closed = "",
      \   auto_open = true,
      \   auto_close = true,
      \   auto_preview = false,
      \   use_lsp_diagnostic_signs = true,
      \   action_keys = {
      \     close_folds = {"zc"},
      \     open_folds = {"zo", "zr", "zR"},
      \     toggle_fold = {"za"},
      \   },
      \ })
