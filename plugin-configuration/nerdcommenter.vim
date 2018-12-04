let g:NERDSpaceDelims=1
let g:NERDDefaultAlign='left'
let g:NERDCommentEmptyLines=1
let g:NERDCommentWholeLinesInVMode=2
let g:NERDSpaceDelims=1
let g:NERDRemoveExtraSpaces=1
let g:NERDRemoveExtraSpaces=1

let g:NERDCustomDelimiters = {
      \ 'solidity': { 'left': '//', 'leftAlt': '/*', 'rightAlt': '*/'},
      \ 'toml': { 'left': '#' }
      \ }



" Functions

" The hook function executed before doing a comment with NERDCommenter.
" Applies better commenting for VueJS, cause it use different filetypes in the
" same file at ones.
"
function! NERDCommenter_before()
  " Only apply this for VueJS files.
  if &filetype ==? 'vue'
    " Backup the original filetype to restore it after make the comment.
    let g:filetype_backup = 'vue'

    " Get the syntax stack to check the filetype for this section.
    let l:stack = synstack(line('.'), col('.'))

    " Default filetype.
    let l:filetype = 'html'

    " Iterate over the whole syntax stack and check them.
    for l:ele in l:stack
      let l:type = synIDattr(l:ele, 'name')

      " Check for filetypes that have higher priority then the default.
      if l:type =~? 'javascript'
        let l:filetype = 'javascript'
        break

      elseif l:type =~? 'scss'
        let l:filetype = 'scss'
        break

      endif
    endfor

    " Set temporally this filetype for the next comment.
    execute 'setfiletype ' . l:filetype
  endif
endfunction

" The hook function executed after done a comment with NERDCommenter.
" This sets back the original filetype that has been artificial adjusted by the
" before hook.
"
function! NERDCommenter_after()
  if exists('g:filetype_backup')
    execute 'setfiletype ' . g:filetype_backup
    unlet g:filetype_backup
  endif
endfunction
