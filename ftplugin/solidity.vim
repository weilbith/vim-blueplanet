if exists('b:did_ftplugin')
  finish
endif

let b:did_ftplugin = 1

" Define the comment options.
setlocal comments=sO:*\ -,mO:*\ \ ,exO:*/,s1:/*,mb:*,ex:*/,://
setlocal commentstring=//\ %s

" Complete comments on new line.
set formatoptions+=ro
