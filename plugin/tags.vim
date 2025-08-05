nnoremap gD           <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap gdd          <cmd>execute 'tselect ' . expand('<cword>')<CR>
nnoremap <unique> grd <cmd>execute 'ptag ' . expand('<cword>')<CR>
