require('dressing').setup({
  input = {
    -- Show window below cursor to not draw over potentially interesting parts.
    override = function(configuration)
      configuration.anchor = 'NW'
      configuration.col = 1
      configuration.row = 1
      return configuration
    end,
  },
  select = {
    enabled = false,
  },
})
