vim.keymap.set({ 'i', 'v' }, '<C-l>', function()
  require('smart-tab').smart_tab()
end, {})
