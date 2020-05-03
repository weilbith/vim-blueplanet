let g:test#custom_strategies = {'floaterm': function({cmd -> plugin#test#floaterm_strategy(cmd)})}
let test#strategy = {
      \ 'nearest': 'floaterm',
      \ 'file': 'floaterm',
      \ 'suite': 'asyncrun_background'
      \ }

let test#enabled_runners = ['python#pytest', 'typescript#mocha']
let g:test#custom_runners = {
      \ 'TypeScript': ['Mocha']
      \ }
let test#python#runner = 'pytest'  " Adjust for projects via localrc
let test#python#pytest#options = {'nearest': '--capture=no'}
