require('plugin_manager').lazy_load_plugin_on_lua_module(
  'nvim-treesitter-textobjects',
  'nvim-treesitter-textobjects'
)

local function select()
  return require('nvim-treesitter-textobjects.select')
end

local function move()
  return require('nvim-treesitter-textobjects.move')
end

vim.keymap.set({ 'o', 'v' }, 'af', function()
  select().select_textobject('@function.outer', 'textobjects')
end, { desc = 'outer function text object' })

vim.keymap.set({ 'o', 'v' }, 'if', function()
  select().select_textobject('@function.inner')
end, { desc = 'inner function text object' })

vim.keymap.set({ 'n', 'o', 'v' }, ']f', function()
  move().goto_next_start('@function.outer')
end, { desc = 'jump to start of next function' })

vim.keymap.set({ 'n', 'o', 'v' }, '[f', function()
  move().goto_previous_start('@function.outer')
end, { desc = 'jump to start of previous/current function' })

vim.keymap.set({ 'n', 'o', 'v' }, ']F', function()
  move().goto_next_end('@function.outer')
end, { desc = 'jump to end of next/current function' })

vim.keymap.set({ 'n', 'o', 'v' }, '[F', function()
  move().goto_previous_end('@function.outer')
end, { desc = 'jump to end of previous function' })

vim.keymap.set({ 'o', 'v' }, 'ac', function()
  select().select_textobject('@class.outer')
end, { desc = 'outer class text object' })

vim.keymap.set({ 'o', 'v' }, 'ic', function()
  select().select_textobject('@class.inner')
end, { desc = 'inner class text object' })

vim.keymap.set({ 'n', 'o', 'v' }, ']c', function()
  move().goto_next_start('@class.outer')
end, { desc = 'jump to start of next class' })

vim.keymap.set({ 'n', 'o', 'v' }, '[c', function()
  move().goto_previous_start('@class.outer')
end, { desc = 'jump to start of previous/current class' })

vim.keymap.set({ 'n', 'o', 'v' }, ']C', function()
  move().goto_next_end('@class.outer')
end, { desc = 'jump to end of next/current class' })

vim.keymap.set({ 'n', 'o', 'v' }, '[C', function()
  move().goto_previous_end('@class.outer')
end, { desc = 'jump to end previous class' })

vim.keymap.set({ 'o', 'v' }, 'aa', function()
  select().select_textobject('@parameter.outer')
end, { desc = 'parameter class text object' })

vim.keymap.set({ 'o', 'v' }, 'ia', function()
  select().select_textobject('@parameter.inner')
end, { desc = 'inner parameter text object' })

vim.keymap.set({ 'n', 'o', 'v' }, ']a', function()
  move().goto_next_start('@parameter.outer')
end, { desc = 'jump to start of next parameter' })

vim.keymap.set({ 'n', 'o', 'v' }, ']A', function()
  move().goto_next_end('@parameter.outer')
end, { desc = 'jump to start of previous/current parameter' })

vim.keymap.set({ 'n', 'o', 'v' }, '[a', function()
  move().goto_previous_start('@parameter.outer')
end, { desc = 'jump to end of next/current parameter' })

vim.keymap.set({ 'n', 'o', 'v' }, '[A', function()
  move().goto_previous_end('@parameter.outer')
end, { desc = 'jump to end previous parameter' })

vim.keymap.set({ 'o', 'v' }, 'a/', function()
  select().select_textobject('@comment.outer')
end, { desc = 'outer comment text object' })

vim.keymap.set({ 'o', 'v' }, 'i/', function()
  select().select_textobject('@comment.outer')
end, { desc = 'inner comment text object' })

vim.keymap.set({ 'n', 'o', 'v' }, ']/', function()
  move().goto_next_start('@comment.outer')
end, { desc = 'jump to start of next comment' })

vim.keymap.set({ 'n', 'o', 'v' }, '[/', function()
  move().goto_previous_start('@comment.outer')
end, { desc = 'jump to start of previous/current comment' })
