function! s:is_packer_file()
  let l:filepath = expand('%:p')
  let l:lines = readfile(l:filepath)
  let l:found_snippet_builders = v:false
  let l:found_snippet_provisioners = v:false

  for l:line in l:lines
    if l:line =~# '"builders":'
      let l:found_snippet_builders = v:true
    elseif l:line =~# '"provisioners":'
      let l:found_snippet_provisioners = v:true
    endif
  endfor

  echo l:found_snippet_builders
  echo l:found_snippet_provisioners

  return l:found_snippet_builders && l:found_snippet_provisioners
endfunction


autocmd BufNewFile,BufRead *.json if s:is_packer_file() | setfiletype packer | endif
