" The maximum height for the quickfix window.
let s:quickfix_height = 10

" List to stored named lists which can be reloaded.
let s:quickfix_store = {}

" Highlighting for named quickfix lists.
highlight NamedQuickfixList ctermbg=237 ctermfg=NONE guibg=#3a3a3a guifg=NONE cterm=NONE gui=NONE


" Function to jump/open (to) the quickfix window, if currently outside.
" Jump back from the quickfix window, if currently inside.
function! utils#quickfix#quickfix_jump() abort
  " Check if current buffer in the window is the quickfixlist.
  if &filetype ==# 'qf'
    wincmd p " Jump back

  " Check is a filled one exists.
  elseif len(getqflist()) <= 0
    call utils#messages#warning('Current quickfix list is empty! Go back in history or fill a new one.')

  " Jump to or open
  else
    execute 'copen'
  endif
endfunction

" Remove the current entry from the quickfix list.
"
function! utils#quickfix#remove_current_entry() abort
  if utils#location#is_location_window(win_getid()) | return | endif
  let l:index = line('.') - 1
  let l:list = getqflist()
  call remove(l:list, l:index)
  call setqflist(l:list, 'r')
endfunction


" Move the quickfix window to the most bottom.
" Shrink the window height of the quickfix window.
" Use one line higher then entries in the quickfix list, to show one empty
" line that this is all in the list.
" If the quickfix list is longer than a configured number, it takes this
" maximum height.
"
function! utils#quickfix#resize_move() abort
  " Make sure being not in a location list window.
  if utils#location#is_location_window(win_getid()) | return | endif

  wincmd J
  let s:quickfix_length = len(getqflist())

  if s:quickfix_length > s:quickfix_height
    exe 'resize ' . s:quickfix_height

  else
    exe 'resize ' . (s:quickfix_length + 1)
  end
endfunction


" Store the current quickfix list with a name.
" The name is requested with and input by user.
" If the selection remains empty, the default name is used.
" If a list with the given name already exists, a confirmation for rewriting is
" requested.
" Does nothing if there is no active list.
"
function! utils#quickfix#store_current_list() abort
  let l:list = getqflist()

  " Only do something if there is a list.
  if !empty(l:list)
    " Get a name for list by the user.
    let l:name = input('Name for list (default): ')
    if empty(l:name) | let l:name = 'default' | endif

    " Request to confirm overwriting the list.
    if has_key(s:quickfix_store, l:name)
      let l:message = "List with name '" . l:name . "' already exist. Overwrite?"
      let l:confirmed = confirm(l:message, "&Yes\n&No", 2, 'Question')

      " End here if should not overwrite.
      if l:confirmed != 1 | return | endif
    endif

    " Store the list and notify user.
    let s:quickfix_store[l:name] = l:list
    echo "List with name '" . l:name . "' has been written."

  else
    call utils#messages#warning('No quickfix list currently exist!')
  endif
endfunction


" Restore a selected list from cache.
" This includes to open the quickfix window, highlight it and set a special
" buffer variable.
"
function! utils#quickfix#restore_stored_list() abort
  let l:name = s:select_stored_list()

  " Set the quickfix list and open its window.
  call setqflist(s:quickfix_store[l:name])
  copen

  " Set the name (useful for other plugins).
  let b:quickfix_list_name = l:name

  " Adjust highlighting to show this is an old list.
  setlocal winhighlight=Normal:NamedQuickfixList
endfunction


" Delete a selected list from the cache.
"
function! utils#quickfix#delete_stored_list() abort
  let l:name = s:select_stored_list()
  unlet s:quickfix_store[l:name]
endfunction


" Internal

" Let the user select from all stored lists with their name to reload.
" An indicator shows if this entry is already the current list.
" The name of the selected list gets returned.
"
" Returns:
"   name - of the selected list in the cache
"
function! s:select_stored_list() abort
  let l:selection = []
  let l:index = 0
  let l:names = sort(keys(s:quickfix_store))
  let l:active_list = getqflist()

  " Build the selection of named lists to choose from.
  for name in l:names
    let l:list = s:quickfix_store[name]
    let l:current = l:active_list == l:list ? ' > ' : '   ' " Marker if list is the currently shown one.
    call add(l:selection, l:current . (l:index + 1) . ' - ' . name  . ' (' . len(l:list) . ')')
    let l:index = l:index + 1
  endfor

  " Ask for list to load and return its name.
  echo 'Select a list: '
  let l:choice = inputlist(l:selection)
  let l:name = l:names[l:choice - 1]

  return l:name
endfunction
