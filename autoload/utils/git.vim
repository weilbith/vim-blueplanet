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
