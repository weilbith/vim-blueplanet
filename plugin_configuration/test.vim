let g:test#custom_strategies = {'floaterm': function({cmd -> plugin#test#floaterm_strategy(cmd)})}
let test#neovim#term_positon = 'botleft'
let test#enabled_runners = ['python#pytest']
let test#python#runner = 'pytest'  " Adjust for projects via localrc
let test#strategy = {
      \ 'nearest': 'floaterm',
      \ 'file': 'floaterm',
      \ 'suite': 'asyncrun_background'
      \ }

" TODO: Fix issue by floaterm of too many arguments
" let test#python#pytest#options = {
"       \ 'nearest': '--capture=no'
"       \ }
