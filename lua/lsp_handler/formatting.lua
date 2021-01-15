local function handle_format_response(error, _, result, _, buffer_number)
  if result == nil then return end

  if error ~= nil then
    -- Do not use print to avoid blocking by require user to confirm message.
    -- vim.cmd("echom '" .. vim.inspect(error) .. "'")
    vim.cmd("echom 'Formatting has failed!'")
    return
  end
  
  local buffer_modified = vim.api.nvim_buf_get_option(buffer_number, "modified")

  if not buffer_modified then
    local preserved_view = vim.fn.winsaveview()
    vim.lsp.util.apply_text_edits(result, buffer_number)
    vim.fn.winrestview(preserved_view)
  end
end

local function setup()
  vim.lsp.handlers["textDocument/formatting"] = handle_format_response
end

return {
  setup = setup
}
