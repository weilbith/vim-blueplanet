if exists('b:did_ftplugin')
  finish
endif

let b:did_ftplugin = 1

" define the comment options.
setlocal commentstring=//\ %s

" Complete comments on new line.
setlocal comments=sO:*\ -,mO:*\ \ ,exO:*/,s1:/*,mb:*,ex:*/,://
setlocal formatoptions+=ro

setlocal suffixesadd=.ts
