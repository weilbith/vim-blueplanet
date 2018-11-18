" Disable the arrow keys.
" Not possible for the command line, cause the mappings for moving the cursor
" point to this keys.
" Normal Mode
nnoremap <Up> <Nop>
nnoremap <Down> <Nop>
nnoremap <Left> <Nop>
nnoremap <Right> <Nop>

" Insert Mode
inoremap <Up> <Nop>
inoremap <Down> <Nop>
inoremap <Left> <Nop>
inoremap <Right> <Nop>

" Visual Mode
vnoremap <Up> <Nop>
vnoremap <Down> <Nop>
vnoremap <Left> <Nop>
vnoremap <Right> <Nop>


" Edit/load vim runtime configuration.
nnoremap <leader>ve :<C-u>call <SID>handleVimrc(v:true)<CR>
nnoremap <leader>vl :<C-u>call <SID>handleVimrc(v:false)<CR>:echom "Vimrc reloaded!"<CR>



" Simply sourcing of mapping groups.
" Use the name of the group.
"
" Argument:
"   group - name of the group as string
"
function! s:source(group) abort
  execute 'source ' . g:base_configuration_folder . '/mapping/' . a:group . '.vim'
endfunction


" Source special sections of mappings.
" Each following mapping is prefixed by the leader.
" Each section has its own/two character(s) which is followed after the
" leader for all their mappings.
call s:source('buffers')       " b
call s:source('search')        " s
call s:source('files')         " f
call s:source('git')           " g
call s:source('location')      " l
call s:source('quickfix')      " q
call s:source('quit')          " Q
call s:source('sessions')      " $
call s:source('tabs')          " T
call s:source('tags')          " t
call s:source('windows')       " w
call s:source('refactor')      " r


" Source mappings that are group but haven't a fixed character.
call s:source('basic-edit')
call s:source('cmd-line')
call s:source('copy-paste')
call s:source('save')
call s:source('toggle')
call s:source('autocompletion')
call s:source('scratch')
call s:source('spelling')


" Further mappings for specific file types are in the 'ftplugin'
" directory of cause.
" They are using the local leader key as prefix, followed by a character that
" specify the language.
"
"    m - markdown
"


" Some prefixed are used for plugins by themself.
"
"  c - nerd commener
"  double leader - easymotion
"  m - signature



" Functions

" Function to work with the runtime configuration main file.
" Core is to differ between the `init.vim` for NeoVim and `.vimrc` for pure Vim.
" Can open the file to edit or source it.
"
" Arguments:
"   edit -  boolean describing if file should be opened to edit
"           If false it will be sourced.
"
function! s:handleVimrc(edit) abort
  " Get the correct file.
  if has('nvim')
    let l:file = g:base_folder . 'init.vim'
  else
    let l:file = $HOME . '/.vimrc'
  endif

  " Edit or source the file based on the argument.
  if (a:edit)
    execute 'edit ' . l:file
  else
    execute 'source ' . l:file
  endif
endfunction
