function! utils#tags#definition() abort
  if luaeval("require'custom.lsp.capabilities'.client_available()")
    if luaeval("require'custom.lsp.capabilities'.client_provides_definition()")
      lua vim.lsp.buf.definition()
    else
      call s:message_feature_not_available()
    endif
  else
    execute 'tag ' . expand('<cword>')
  endif
endfunction

function! utils#tags#implementation() abort
  if luaeval("require'custom.lsp.capabilities'.client_available()")
    if luaeval("require'custom.lsp.capabilities'.client_provides_implementation()")
      lua vim.lsp.buf.implementation()
    else
      call s:message_feature_not_available()
    endif
  else
      call s:message_client_not_available()
  endif
endfunction

function! utils#tags#references() abort
  if luaeval("require'custom.lsp.capabilities'.client_available()")
    if luaeval("require'custom.lsp.capabilities'.client_provides_references()")
      lua vim.lsp.buf.references()
    else
      call s:message_feature_not_available()
    endif
  else
    execute 'tselect ' . expand('<cword>')
  endif
endfunction

function! utils#tags#type_definition() abort
  if luaeval("require'custom.lsp.capabilities'.client_available()")
    if luaeval("require'custom.lsp.capabilities'.client_provides_type_definition()")
      lua vim.lsp.buf.type_definition()
    else
      call s:message_feature_not_available()
    endif
  else
      call s:message_client_not_available()
  endif
endfunction

function! utils#tags#declaration() abort
  if luaeval("require'custom.lsp.capabilities'.client_available()")
    if luaeval("require'custom.lsp.capabilities'.client_provides_declaration()")
      lua vim.lsp.buf.declaration()
    else
      call s:message_feature_not_available()
    endif
  else
      call s:message_client_not_available()
  endif
endfunction

function! utils#tags#hover() abort
  if luaeval("require'custom.lsp.capabilities'.client_available()")
    if luaeval("require'custom.lsp.capabilities'.client_provides_hover()")
      lua vim.lsp.buf.hover()
    else
      call s:message_feature_not_available()
    endif
  else
    execute &keywordprg . ' ' . expand('<cword>')
  endif
endfunction

function! s:message_feature_not_available() abort
  echo 'Language server does not provide this feature!'
endfunction

function! s:message_client_not_available() abort
  echo 'Language client not available!'
endfunction
