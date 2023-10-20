local function get_git_signs_highlight_group()
  local git_signs_namespace_id = vim.api.nvim_get_namespaces()['gitsigns_extmark_signs_']

  if git_signs_namespace_id then
    local mark = vim.api.nvim_buf_get_extmarks(
      0,
      git_signs_namespace_id,
      { vim.v.lnum - 1, 0 },
      { vim.v.lnum, 0 },
      { limit = 1, details = true }
    )[1]

    if mark then
      local details = mark[4]
      return details['sign_hl_group']
    end
  end
end

return {
  init = function(self)
    self.gitsigns_highlight_group = get_git_signs_highlight_group()
  end,
  provider = '▌',
  hl = function(self)
    return self.gitsigns_highlight_group or 'DarkGrey'
  end,
}
