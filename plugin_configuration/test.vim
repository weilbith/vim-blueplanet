let test#strategy = {
      \ 'nearest': 'neomake',
      \ 'file': 'neovim',
      \ 'suite': 'neomake'
      \ }

let test#strategy = 'neovim'

let test#neovim#term_positon = 'botleft'
let test#enabled_runners = ['javascript#mocha']
let test#runner_commands = ['Mocha']

let g:test#javascript#mocha#file_pattern = '\Vtest\.(js|ts)$'
" let test#javascript#mocha#options = '--timeout 8000 --require isomorphic-fetch -r ts-node/register'
let test#javascript#mocha#executable = 'npx mocha'
