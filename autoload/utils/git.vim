" Toggle the Agit plugin tab.
" If inside the tab of agit, close it.
" Else open the Agit tab.
"
" Argument:
"   cmd - the Agit command used to open the buffer
"
function! utils#git#toggleAgit(cmd) abort
  " Determine the Agit tab by the fact that all buffers have the custom
  " file-type 'agit'.
  if &filetype ==? 'agit'
    tabclose

  else
    execute a:cmd
  endif
endfunction

function! utils#git#toggleDiff() abort
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
