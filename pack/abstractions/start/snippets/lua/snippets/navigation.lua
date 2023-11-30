local DIRECTION_FORWARDS = 1
local DIRECTION_BACKWARDS = -1

local function jump_forward()
  if vim.snippet.jumpable(DIRECTION_FORWARDS) then
    vim.snippet.jump(DIRECTION_FORWARDS)
  elseif type(vim.g.snippet_navigation_jump_forward) then
    vim.g.snippet_navigation_jump_forward()
  end
end

local function jump_backward()
  if vim.snippet.jumpable(DIRECTION_BACKWARDS) then
    vim.snippet.jump(DIRECTION_BACKWARDS)
  elseif type(vim.g.snippet_navigation_jump_backward) then
    vim.g.snippet_navigation_jump_backward()
  end
end

return {
  jump_forward = jump_forward,
  jump_backward = jump_backward,
}
