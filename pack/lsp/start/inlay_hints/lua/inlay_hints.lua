local group_identifier = vim.api.nvim_create_augroup('InlayHints', {})

local function inlay_hints_are_supported(buffer_number)
  local clients_with_support = vim.lsp.get_clients({
    method = 'textDocumen/inlayHint',
    bufnr = buffer_number,
  })
  return #clients_with_support > 0
end

local function create_auto_commands()
  vim.api.nvim_create_autocmd({ 'LspAttach', 'InsertLeave' }, {
    group = group_identifier,
    callback = function(arguments)
      if inlay_hints_are_supported(arguments.buf) then
        vim.lsp.inlay_hint.enable(true, { bufnr = arguments.buf })
      end
    end,
  })

  vim.api.nvim_create_autocmd({ 'InsertEnter' }, {
    group = group_identifier,
    callback = function(arguments)
      if inlay_hints_are_supported(arguments.buf) then
        vim.lsp.inlay_hint.enable(false, { bufnr = arguments.buf })
      end
    end,
  })

  -- UUUUGLY workaround to redraw hints based on filtering.
  -- Inlay hints get only redrawn if the buffer version has changed since last
  -- time. This gets reset when toggling as the state is cleared.
  -- TODO: avoid flickering within same section...
  vim.api.nvim_create_autocmd({ 'CursorHold' }, {
    group = group_identifier,
    callback = function(arguments)
      if vim.lsp.inlay_hint.is_enabled({ bufnr = arguments.buf }) then
        vim.lsp.inlay_hint.enable(false, { bufnr = arguments.buf })
        vim.lsp.inlay_hint.enable(true, { bufnr = arguments.buf })
      end
    end,
  })
end

local function clear_auto_commands()
  vim.api.nvim_clear_autocmds({ group = group_identifier })
end

return {
  create_auto_commands = create_auto_commands,
  clear_auto_commands = clear_auto_commands,
}
