require('hlslens').setup({
  auto_enable = false,
  calm_down = true,
})

-- This plugin gets lazy loaded when the first search gets started. The plugins
-- setup `auto_enable` feature uses the same event to enable it. But as the
-- plugin just gets loaded by this event, it would only work for the second
-- search. Thereby a manual enabling is necessary.
require('hlslens').enable()
