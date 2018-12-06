" Move the twiggy window to the most left.
" Restore its width afterwards by global settings.
" Only working when being within the twiggy buffer.
"
function! plugin#twiggy#resize_move() abort
  if &filetype !=# 'twiggy' | return | endif

  wincmd H
  execute 'vertical resize ' . get(g:, 'twiggy_num_columns', 40)
endfunction
