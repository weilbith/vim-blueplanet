vim.g.format_buffer_function = function(buffer)
  require('conform').format({
    bufnr = buffer,
    lsp_format = "first",
    filter = function (client)
      -- Causes issues in combination with Prettier formatting.
      -- Disabling formatting on server configuration causes issues in conform.
      return client.name ~= "VSCode TypeScript Wrapper"
    end
  })
end
