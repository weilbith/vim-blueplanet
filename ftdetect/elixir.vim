silent! autocmd! filetypedetect BufNewFile,BufRead *.ex " Overwrite default detection
autocmd BufNewFile,BufRead *.ex setfiletype elixir
