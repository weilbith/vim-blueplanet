local gps = require('nvim-gps')
local get_highlight = require('heirline.utils').get_highlight
local insert_components = require('heirline.utils').insert
local get_icon_color = require('nvim-web-devicons').get_icon_color

gps.setup()

local BreadcrumbsBlock = {
  init = function(self)
    self.full_path = vim.api.nvim_buf_get_name(0)
    self.separator = '  '
  end,
}

local FileBlock = {
  init = function(self)
    self.icon, self.color = get_icon_color(self.full_path, nil, { default = true })
  end,
  hl = function(self)
    return { fg = self.color, bold = true }
  end,
}

local FileIcon = {
  provider = function(self)
    return self.icon .. (self.icon and ' ')
  end,
}

local FileName = {
  provider = function(self)
    return vim.fn.fnamemodify(self.full_path, ':t')
  end,
}

local FilePath = {
  provider = function(self)
    local relative_path = vim.fn.fnamemodify(self.full_path, ':.:h')
    local path_parts = vim.split(relative_path, '/')
    local path = ' '

    for index, part in ipairs(path_parts) do
      if part ~= '.' then
        path = path .. part

        if next(path_parts, index) then
          path = path .. self.separator
        end
      end
    end

    return path
  end,
  hl = get_highlight('White'),
}

local Separator = {
  provider = function(self)
    return self.separator
  end,
}

local locationTypeToHighlight = {
  ['class-name'] = 'Purple',
  ['method-name'] = 'Green',
  ['function-name'] = 'Green',
}

local CodeLocation = {
  provider = function(self)
    local data = gps.is_available() and gps.get_data() or {}
    local location = ''

    for index, part in ipairs(data) do
      local is_last = next(data, index) == nil
      local color = locationTypeToHighlight[part.type] or 'White'
      local full_color = color .. (is_last and 'Bold' or 'Italic')

      location = location .. '%#' .. full_color .. '#'
      location = location .. self.separator
      location = location .. part.icon .. part.text
      location = location .. '%#-#'
    end

    return location
  end,
  hl = get_highlight('WhiteItalic'),
}

return insert_components(
  BreadcrumbsBlock,
  FilePath,
  insert_components(FileBlock, Separator, FileIcon, FileName),
  CodeLocation
)
