function! utils#lsp#is_client_available_for_current_buffer() abort
  return luaeval('next(vim.lsp.buf_get_clients()) ~= nil')
endfunction
