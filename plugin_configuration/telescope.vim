scriptencoding utf-8

lua << EOF
require('telescope').setup{
  defaults = {
    prompt_prefix = "➭ ",
    winblend = 10,
    file_ignore_patterns = { "%.fls", "%.fdb_latexmk" }
  }
}
EOF

highlight default link TelescopeNormal          NormalFloat
highlight default link TelescopeBorder          BlueBold
highlight default link TelescopeMatching        GreenItalic
highlight default link TelescopePromptPrefix    BlueBold
highlight default link TelescopeSelection       OrangeBackground
highlight default link TelescopeMultiSelection  YellowBackground
