" Set list bullets and blockquotes as comments to repeat them on new line.
setlocal comments=b:*,b:-,b:+,b:>
setlocal formatoptions+=ro
setlocal formatoptions-=c

" Activate syntax options.
let g:markdown_fenced_languages = ['sh', 'vim', 'javascript', 'python', 'rust', 'solidity']
