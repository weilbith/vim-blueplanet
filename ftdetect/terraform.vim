silent! autocmd! filetypedetect BufNewFile,BufRead *.tf " Overwrite default detection
autocmd BufNewFile,BufRead *.{tf,tfvars} setfiletype terraform
autocmd BufNewFile,BufRead *.{tfstate,ftstate.backup} setfiletype json
