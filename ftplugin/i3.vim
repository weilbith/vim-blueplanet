if exists('b:did_ftplugin')
  finish
endif

let b:did_ftplugin = 1

" Define the comment options.
setlocal comments=b:#
setlocal commentstring =#\ %s
