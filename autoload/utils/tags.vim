function! utils#tags#open() abort
  if utils#lsp#is_client_available_for_current_buffer()
    lua vim.lsp.buf.definition()
  else
    execute 'tag ' . expand('<cword>')
  endif
endfunction

function! utils#tags#preview() abort
  if utils#lsp#is_client_available_for_current_buffer()
    lua vim.lsp.buf.peek_definition()
  else
    execute 'ptjump ' . expand('<cword>')
  endif
endfunction

function! utils#tags#references() abort
  if utils#lsp#is_client_available_for_current_buffer()
    lua vim.lsp.buf.references()
    echom 'ja lol ey'
  else
    execute 'tselect ' . expand('<cword>')
  endif
endfunction

function! utils#tags#hover() abort
  if utils#lsp#is_client_available_for_current_buffer()
    lua vim.lsp.buf.hover()
  else
    execute &keywordprg . ' ' . expand('<cword>')
  endif
endfunction

function! utils#tags#signature() abort
  if utils#lsp#is_client_available_for_current_buffer()
    lua vim.lsp.buf.signature_help()
  endif
endfunction
