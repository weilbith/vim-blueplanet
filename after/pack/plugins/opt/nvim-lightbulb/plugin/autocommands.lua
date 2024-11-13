local group = vim.api.nvim_create_augroup("LightBulb", {});
vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
  callback = function()
    require('nvim-lightbulb').update_lightbulb()
  end,
})
