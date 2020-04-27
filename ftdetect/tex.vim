silent! autocmd! filetypedetect BufNewFile,BufRead *.tex " Overwrite default detection
autocmd BufNewFile,BufRead *.tex setfiletype tex
