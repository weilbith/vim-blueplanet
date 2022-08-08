require('dressing').setup({
  input = {
    override = function(configuration)
      configuration.col = -1
      configuration.row = 0
      return configuration
    end,
  },
  select = {
    enabled = false,
  },
})
