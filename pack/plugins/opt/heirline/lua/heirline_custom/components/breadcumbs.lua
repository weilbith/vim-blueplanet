local insert_components = require('heirline.utils').insert

return insert_components({
  provider = function()
    local ok, dropbar_heirline = pcall(require, 'dropbar_custom.heirline')

    if ok then
      return dropbar_heirline.provider()
    end
  end,
})
