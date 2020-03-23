autocmd BufNewFile,BufRead *.{tf,tfvars} setfiletype terraform
autocmd BufRead,BufNewFile *.tfstate setfiletype json
