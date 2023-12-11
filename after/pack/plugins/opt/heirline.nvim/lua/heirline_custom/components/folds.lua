local get_fill_character = require('custom.utils').get_fill_character

local function is_fold_start()
  return vim.fn.foldlevel(vim.v.lnum) > vim.fn.foldlevel(vim.v.lnum - 1)
end

local function fold_is_open()
  return vim.fn.foldclosed(vim.v.lnum) == -1
end

local function is_wrapped_line()
  return vim.v.virtnum > 0
end

local FOLD_OPEN_CHARACTER = get_fill_character('foldopen')
local FOLD_CLOSE_CHARACTER = get_fill_character('foldclose')

-- TODO: Figure out if line is in currently open fold and highlight it plus | character
return {
  provider = function()
    if is_wrapped_line() or not is_fold_start() then
      return ' '
    elseif fold_is_open() then
      return FOLD_OPEN_CHARACTER
    else
      return FOLD_CLOSE_CHARACTER
    end
  end,
  hl = 'Grey',
}
