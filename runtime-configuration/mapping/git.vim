nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gc :Gcommit<CR>
nnoremap <leader>gp :Gpush<CR>
nnoremap <leader>gd :<C-u>call <SID>toggleDiff()<CR>
nnoremap <leader>gP :Gpull<CR>
nnoremap <silent> <leader>gl :<C-u> call <SID>toggleAgit('Agit')<CR>
nnoremap <silent> <leader>gL :<C-u> call <SID>toggleAgit('AgitFile')<CR>
nnoremap <leader>gb :Twiggy<CR>
nnoremap <leader>gB :Gblame<CR>


" Functions

" Toggle the Agit plugin tab.
" If inside the tab of agit, close it.
" Else open the Agit tab.
"
" Argument:
"   cmd - the Agit command used to open the buffer
"
function! s:toggleAgit(cmd) abort
  " Determine the Agit tab by the fact that all buffers have the custom
  " file-type 'agit'.
  if &filetype ==? 'agit'
    tabclose

  else
    execute a:cmd
  endif
endfunction

function! s:toggleDiff() abort
  " Determine if we are in a diffmode window.
  if &diff
    " Turn off the diffmode for all windows in the tab and close current
    " window, cause else the same file is open in two windows.
    diffoff!
    wincmd c
  else
    " Open diffmode for Git.
    Gdiff
  endif
endfunction
