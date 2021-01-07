scriptencoding utf-8

lua require('telescope').setup({
    \   defaults = {
    \     prompt_prefix = "➭ ",
    \     winblend = 10,
    \     file_ignore_patterns = { "%.fls", "%.fdb_latexmk" }
    \   }
    \ })
