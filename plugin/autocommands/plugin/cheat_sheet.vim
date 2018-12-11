augroup CheatsheetCustom
  autocmd!
  autocmd BufEnter _cheat call plugin#cheat_sheet#add_mappings()
augroup END
