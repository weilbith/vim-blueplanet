local function get_shell_output(command)
  local handle = io.popen(command .. ' 2>/dev/null')
  local output = handle:read('*all')
  handle:close()
  return vim.fn.substitute(output, '\\n', '', 'g')
end

return {
  get_shell_output = get_shell_output,
}
