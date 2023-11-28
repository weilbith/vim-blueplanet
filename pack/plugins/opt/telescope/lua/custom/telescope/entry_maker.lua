local entry_display = require('telescope.pickers.entry_display')

local displayer = entry_display.create({
  separator = '  ',
  items = {
    { width = 1 },
    {},
    { remaining = true },
  },
})

local make_display = function(entry)
  return displayer({
    { entry.icon, entry.icon_highlight },
    { entry.file_name, 'White' },
    { entry.directory_path, 'LightGreyItalic' },
  })
end

local function file_entry_maker(file_path)
  local directory_path = vim.fn.fnamemodify(file_path, ':p:h')
  local file_name = vim.fn.fnamemodify(file_path, ':p:t')
  local file_extension = vim.fn.fnamemodify(file_path, ':t:e')
  local icon, icon_highlight = require('nvim-web-devicons').get_icon(
    file_name,
    file_extension,
    { default = true }
  )

  return {
    value = file_path,
    ordinal = file_path,
    display = make_display,
    icon = icon,
    icon_highlight = icon_highlight,
    file_name = file_name,
    directory_path = directory_path,
  }
end

return {
  file_entry_maker = file_entry_maker,
}
