" Vim indent file
" Language: Scss
" Acknowledgement: Inspired by https://github.com/cakebaker/scss-syntax.vim

if exists('b:did_indent')
  finish
endif

let b:did_indent = 1


setlocal nosmartindent
setlocal indentexpr=GetScssIndent(v:lnum)

let s:cpo_save = &cpoptions
set cpoptions&vim


function! GetScssIndent(lnum) abort
  " { -> increase indent
  " } -> decrease indent
  if a:lnum == 1
    " start at 0 indentation
    return 0
  endif

  " Search for the last line with a opening or closing bracket.
  " Ignore commented lines.
  let l:regex = '\([{}]\)\%(\/\/.*\)\?$'
  let l:nr = search(l:regex, 'bnW')

  " If any bracket has been found.
  if l:nr > 0
    let l:last = indent(l:nr)
    let l:m = matchlist(getline(l:nr), l:regex)
    let l:m_curr = matchlist(getline(a:lnum), l:regex)
    echoe string(l:m).string(l:m_curr)

    " Last was an opening bracket and current is close, so use same indentation.
   if !empty(l:m_curr) && l:m_curr[1] ==? '}' && l:m[1] ==? '{'
      return l:last

    " Last was closing bracket and last also, so decrease indentation.
    elseif !empty(l:m_curr) && l:m_curr[1] ==? '}' && l:m[1] ==? '}'
      return l:last - &shiftwidth

    " Last was open bracket and no further found, so increase indentation.
    elseif l:m[1] ==? '{'
      return l:last + &shiftwidth

    " Last was closing bracket and not further found, so use same indentation.
    else
      return l:last
    endif

  else
    return 0
  endif
endfunction


let &cpoptions = s:cpo_save
unlet s:cpo_save
