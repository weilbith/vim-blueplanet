" Split new window
nnoremap <silent> <leader>ws :split<CR>
nnoremap <silent> <leader>wv :vsplit<CR>

" Close window (active one or selection)
nnoremap <silent> <leader>wc :close<CR>
nnoremap <silent> <leader>wC :ChooseWin \| close<CR>

" Jump to/close preview window
nnoremap <silent> <leader>wp :wincmd p<CR>
nnoremap <silent> <leader>wz :wincmd z<CR>

" Jump back to last window.
nnoremap <silent> <leader>wb :wincmd p<CR>

" Choose a window (use the ChooseWin plugin).
nnoremap <silent> <leader>ww :ChooseWin<CR>

" Jump between windows of a split layout.
nnoremap <silent> <leader>wh :wincmd h<CR>
nnoremap <silent> <leader>wj :wincmd j<CR>
nnoremap <silent> <leader>wk :wincmd k<CR>
nnoremap <silent> <leader>wl :wincmd l<CR>

" By id (works nice with the airline section for the window id)
nnoremap <silent> <leader>w1 :1wincmd w<CR>
nnoremap <silent> <leader>w2 :2wincmd w<CR>
nnoremap <silent> <leader>w3 :3wincmd w<CR>
nnoremap <silent> <leader>w4 :4wincmd w<CR>
nnoremap <silent> <leader>w5 :5wincmd w<CR>
nnoremap <silent> <leader>w6 :6wincmd w<CR>
nnoremap <silent> <leader>w7 :7wincmd w<CR>
nnoremap <silent> <leader>w8 :8wincmd w<CR>
nnoremap <silent> <leader>w9 :9wincmd w<CR>

" Resize active window.
" In-/Decrease width/height by using submode (submodes plugin required)
call submode#enter_with('resize', 'n', '', '<space>wrk', '<C-w>+')
call submode#enter_with('resize', 'n', '', '<space>wrj', '<C-w>-')
call submode#enter_with('resize', 'n', '', '<space>wrl', '<C-w>>')
call submode#enter_with('resize', 'n', '', '<space>wrh', '<C-w><')
call submode#map('resize', 'n', '', 'k', '<C-w>+')
call submode#map('resize', 'n', '', 'j', '<C-w>-')
call submode#map('resize', 'n', '', 'l', '<C-w>>')
call submode#map('resize', 'n', '', 'h', '<C-w><')

" In-/Decrease or set to fixed width/height by user input.
noremap <silent> <leader>wrH :<C-u>call <SID>windowChangeSize('height')<CR>
noremap <silent> <leader>wrW :<C-u>call <SID>windowChangeSize('width')<CR>

" Maximize current window (with Goyo plugin)
nnoremap <silent> <leader>wm :<C-u> call <SID>toggle_max_window()<CR>

" Move windows.
" Swap active window with a selected one.
nnoremap <leader>w<Tab> :ChooseWinSwap<CR>

" Move window to the edges.
nnoremap <silent> <leader>wH :wincmd H<CR>
nnoremap <silent> <leader>wJ :wincmd J<CR>
nnoremap <silent> <leader>wK :wincmd K<CR>
nnoremap <silent> <leader>wL :wincmd L<CR>

" Switch split layout.
nnoremap <leader>wS :<C-u>call <SID>switch_window_split(v:true)<CR>
nnoremap <leader>wV :<C-u>call <SID>switch_window_split(v:false)<CR>




" Functions

" Change the size of the active window by a user input.
" There are two modes 'height' and 'width', which have to provided as first argument.
" The user input is used as set to a fixed width/height by a plain number,
" or a relative in-/decrease of the current width/height by prefix a '+' or '-'.
" The procedure can be interrupted by hitting <Esc>.
" Furthermore it shows the current width or height in brackets.
"
" Arguments:
"   mode - decide if to change the 'width' or 'height'
"
function! s:windowChangeSize(mode)
  " Set the vertical parameter if the width should be changed.
  let l:vertical = ''
  if a:mode == 'width' | let l:vertical = 'vertical ' | endif

  " Get the current window width/height.\
  let l:size = winheight('%')
  if a:mode == 'width' | let l:size = winwidth('%') | endif

  " Request user for the adjustment.
  let l:change = input('In-/Decrease by (+/- number) or set to fix width/height (number) [' . l:size .']: ')

  " End here, if no input has given.
  if l:change == '' | return | endif

  " Change windows size.
  execute l:vertical . 'resize ' . l:change
endfunction


" Toggle a window between maximized and normal.
" Use the Goyo plugin to maximize the window.
" Functions restore the line position that has been used within the maximized window.
"
function! s:toggle_max_window()
  " Maximize the window if its the first time, or if no window is currently maximized.
  if !exists('s:window_maximized') || !s:window_maximized
    let s:maximized_window_id = win_getid() " Store window, cause exiting maximized land in different window
    let s:window_maximized = v:true
    execute("Goyo")

  " Minimize window, if any has been maximized before.
  else
    let s:window_maximized = v:false
    let l:line = line(".") " Store line, cause exiting maximized window scroll to the top.
    wincmd q
    call win_gotoid(s:maximized_window_id)
    execute(":" . l:line)

  endif
endfunction


" Switch to a vertical or horizontal split between two windows.
" Switching to currently used split results into the equal split.
" This is between the current window and the one window which is focused, when close the active window.
" This function does not adjust the windows height after the switch, cause this can't work correctly.
"
" Arguments:
"   horizontal - Boolean to differ between both layouts.
"
function! s:switch_window_split(horizontal) abort
  let l:bufnr = bufnr('%')  " Get current buffer number to restore it in the new window.
  if a:horizontal | let l:vert = '' | else | let l:vert = 'vert ' | endif

  " Close current window and open new split with the cached buffer number.
  wincmd c
  execute l:vert . 'sbuffer ' . l:bufnr
endfunction
