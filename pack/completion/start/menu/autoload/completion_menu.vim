" The purpose of using a Lua implementation is that in Lua it is possible to
" save a function in a global variable which does not work for VimL. But there
" is a still a VimL function to make it accesible in plain `<expr>` mappings.

function! completion_menu#is_open() abort
  return luaeval('require("completion_menu").is_open()')
endfunction
