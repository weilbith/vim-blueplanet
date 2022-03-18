require('scrollbar').setup({
  show = true,
  handle = {
    color = '#1f2023', -- Hacky...
  },
  marks = {
    Search = { text = { '―', '═' }, priority = 0 },
    Error = { text = { '―', '═' }, priority = 1 },
    Warn = { text = { '―', '═' }, priority = 2 },
    Info = { text = { '―', '═' }, priority = 3 },
    Hint = { text = { '―', '═' }, priority = 4 },
    Misc = { text = { '―', '═' }, priority = 5 },
  },
  handlers = {
    diagnostic = true,
    search = false, -- Lazy load with hlslens sucks
  },
})
