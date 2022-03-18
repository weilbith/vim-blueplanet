local function is_test_file()
  local file_path = vim.api.nvim_buf_get_name(0)
  local ok, result = pcall(vim.api.nvim_call_function, 'test#test_file', { file_path })

  return ok and result > 0
end

return {
  is_test_file = is_test_file,
}
