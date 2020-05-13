if exists('g:started_by_firenvim')
  " Hide some UI elements
  set laststatus=0
  set showmode
  set foldcolumn=0
  set nonumber
  set norelativenumber
  call sy#disable()
  nnoremap <silent> <Esc><Esc> <cmd>call firenvim#focus_page()<CR>
  nnoremap <silent> <leader>Zz <cmd>call firenvim#hide_frame()<CR>
endif
