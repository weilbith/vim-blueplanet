vim.lsp.handlers["textDocument/formatting"] = function(error, _, result, _, buffer_number)
  print("Got formatting response")
  if result == nil then return end

  if error ~= nil then
    print(vim.inspect(error))
    print("Formatting has failed!")
    return
  end
  
  local buffer_modified = vim.api.nvim_buf_get_option(buffer_number, "modified")

  if not buffer_modified then
    local preserved_view = vim.fn.winsaveview()
    vim.lsp.util.apply_text_edits(result, buffer_number)
    vim.fn.winrestview(preserved_view)
  end
end
