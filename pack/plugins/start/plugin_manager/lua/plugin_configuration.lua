--- Enforces to reload all filetype plugins for the active buffers.
--- This is "useful" for filetype plugins which are lazy loaded by an optional
--- package, because they don't work within a start package.
---
--- Attention: This will reload ALL available filetype plugins!
---
--- This is a little "hack" by re-setting the filetype of each buffer.
local function reload_filetype_plugins_for_loaded_buffers()
  for buffer_number in ipairs(vim.api.nvim_list_bufs()) do
    vim.bo[buffer_number].filetype = vim.bo[buffer_number].filetype
  end
end

return {
  reload_filetype_plugins_for_loaded_buffers = reload_filetype_plugins_for_loaded_buffers,
}
