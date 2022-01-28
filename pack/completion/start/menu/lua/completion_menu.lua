-- This is an approach to generalize or extend the native `pumvisible()`
-- function. This has become necessary to support custom completion menus but
-- still support independent mappings that alternate their behavior depending on
-- if there is an open menu or not.

local function default_is_open_function()
  return vim.fn['pumvisible']() and true or false
end

local function is_open()
  return (
    vim.g.completion_menu_is_open_function
    or default_is_open_function
  )()
end

return {
  is_open = is_open,
}
