augroup Formatting
  autocmd!
  autocmd BufWritePre * mkview |
        \ try |
        \   undojoin |
        \   Neoformat |
        \ catch /^Vim\%((\a\+)\)\=:E790/ |
        \ finally |
        \   silent Neoformat |
        \ endtry |
        \ loadview
augroup END
