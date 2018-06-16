" Fold levels
let s:level_tags = '1'
let s:level_properties = '2'
let s:level_property_function = '3'

" Pattern
let s:pattern_tags_begin = '^<\(template\|script\|style\)'
let s:pattern_tags_end = '^<\/\(template\|script\|style\)'
let s:pattern_vue_end = '^}$'
let s:pattern_properties = '^\s*'.
      \ '\(name\|components\|mixins\|template\|model\|props\|data\|computed\|watch\|filters\|methods\|' .
      \ 'beforeCreated\|created\|beforeMount\|mounted\|beforeUpdate\|updated\|beforeDestory\|destroyed\)'
let s:pattern_properties_function = '^\s*\(function\)\?\s\?\a\+\s\?(.*)\s\?{'
let s:pattern_properties_function_not = '^\s*\(if\|for\|while\)\+'

" Generate the folds text for the `foldtext` option.
" Use the name of the tag, Vue property or function name
" and extend it by the number of lines in this section.
"
function! FoldText()
  let l:line = getline(v:foldstart)
  let l:line_count = (v:foldend - v:foldstart)

  " Title for a tag fold.
  if l:line =~? s:pattern_tags_begin
    let l:title = substitute(l:line, '\s', '', '')

  " Title for a Vue property fold.
  elseif l:line =~? s:pattern_properties
    let l:title = substitute(l:line, '^.*\zs[:(].*', '', '')

  " Title for a Vue property function.
  else
    let l:title = l:line
  endif

  return l:title . ' [' . l:line_count . ' lines]'
endfunction


" Return the fold level for the `foldexpr` option.
" Try to fold the content by VueJS single file structure.
" This focus on the VueJS object and not the template or style.
"
function! FoldExpr()
  let l:line = getline(v:lnum)
  let l:line_next = getline(v:lnum + 1)

  " Check if line is the begin header of a tag.
  if l:line =~? s:pattern_tags_begin
    return '>' . s:level_tags

  " Check if next line is the end header of a tag.
  elseif l:line =~? s:pattern_tags_end
    return '<' . s:level_tags

  " Check if this is the closing line of the Vue object.
  elseif l:line =~? s:pattern_vue_end
    return s:level_tags

  " If inside a tag check if being a special Vue property.
  elseif l:line =~? s:pattern_properties
    return '>' . s:level_properties

  " Check if this is the line before the next Vue property.
  elseif l:line_next =~? s:pattern_properties
    return s:level_properties - 1

  " If inside a special Vue property check if being a function of it.
  elseif l:line =~? s:pattern_properties_function &&
        \ l:line !~? s:pattern_properties_function_not
    return '>' . s:level_property_function

  elseif l:line_next =~? s:pattern_properties_function &&
        \ l:line_next !~? s:pattern_properties_function_not
    return s:level_property_function - 1

  " Everything else should have the same level as line before.
  else
    return '='

  endif
endfunction


" Use custom fold expression and text.
setlocal foldmethod=expr
setlocal foldexpr=FoldExpr()
setlocal foldtext=FoldText()

" Fold inside the main tags per default.
setlocal foldlevel=0

" Avoid to fold Vue properties with single lines.
setlocal foldminlines=2
