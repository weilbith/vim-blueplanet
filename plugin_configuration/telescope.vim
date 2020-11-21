scriptencoding utf-8

lua << EOF
require('telescope').setup{
  defaults = {
    prompt_prefix = "➭ ",
    file_ignore_patterns = { "%.fls", "%.fdb_latexmk" },
    winblend = 10,
  }
}
EOF

highlight default link TelescopeNormal          NormalFloat
highlight default link TelescopeBorder          BlueBold
highlight default link TelescopeMatching        GreenItalic
highlight default link TelescopePromptPrefix    BlueBold
highlight default link TelescopeSelection       Visual
highlight default link TelescopeMultiSelection  VisualNOS
