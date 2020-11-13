let test#strategy = {
      \ 'nearest': 'floaterm',
      \ 'file': 'floaterm',
      \ }

let test#enabled_runners = ['python#pytest', 'typescript#mocha', 'typescript#jest']
let g:test#custom_runners = {
      \ 'TypeScript': ['Mocha', 'Jest']
      \ }
let test#python#runner = 'pytest'  " Adjust for projects via localrc
let test#python#pytest#options = {'nearest': '--capture=no'}
