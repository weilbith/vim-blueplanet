local M = {}

M.shfmt = {
  formatCommand = 'shfmt -ci -bn -s -i ' .. vim.bo.shiftwidth,
  formatStdin = true,
}

return M
