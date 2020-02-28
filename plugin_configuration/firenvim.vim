if exists('g:started_by_firenvim')
  " Hide some UI elements
  set laststatus=0
  set showmode
  set foldcolumn=0
  set nonumber
  set norelativenumber
  call sy#disable()
  nnoremap <silent> <Esc><Esc> :<C-u>call firenvim#focus_page()<CR>
  nnoremap <silent> <leader>Zz :<C-u>call firenvim#hide_frame()<CR>
endif
