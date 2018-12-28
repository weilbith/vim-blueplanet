" Set the name of a tab page.
" Verifies if a given tab page number is valid.
" If no argument is given, the current tab is used.
" Asks the user for input to set the name.
"
" Arguments:
"   tab number - number of the tab page to set the name for (optional)
"
function! utils#tabs#set_name(...) abort
  " Use the current tab per default.
  let l:number = tabpagenr()

  " Use the provided tab page number if given.
  if exists(a:0)
    if !s:check_tab_page_number(a:0) | return | endif

    let l:number = a:0
  endif


  " Get the name by user input.
  let l:name = input('Rename tab to: ')

  " Make sure to have a valid name.
  if empty(l:name)
    call utils#messages#warning('Cancel by empty name!')
    return
  endif

  call settabvar(l:number, 'name', l:name)

  " Update statusline immediately.
  if exists('*lightline#update')
    call lightline#update()
  endif
endfunction


" Get the name of a tab page.
" Verifies if a given tab page number is valid.
" If no argument is given, the current tab is used.
"
" Arguments:
"   tab number - number of the tab page to get the name from (optional) 
"
" Returns:
"   name - the name of the selected tab page
"
function! utils#tabs#get_name(...) abort
  " Use the current tab per default.
  let l:number = tabpagenr()

  " Use the provided tab page number if given.
  if exists(a:0)
    if !s:check_tab_page_number(a:0) | return | endif

    let l:number = a:0
  endif

  return gettabvar(l:number, 'name', 'Tab')
endfunction


" Internal

" Verify if the given tab number is within the range of existing ones.
" Includes a warning message if not.
"
function! s:check_tab_page_number(number) abort
  if a:number > 0 && a:number <= tabpagenr('$')
    return v:true

  else
    call utils#messages#warning('Provided tab page number out of range!')
    return v:false
  endif
endfunction
