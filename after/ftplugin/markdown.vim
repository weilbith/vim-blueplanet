" Set list bullets and blockquotes as comments to repeat them on new line.
setlocal comments=b:*,b:-,b:+,b:>
let b:undo_ftplugin .= '|setlocal comments<'

setlocal formatoptions+=ro
setlocal formatoptions-=c
let b:undo_ftplugin .= '|setlocal formatoptions<'

let b:delimitMate_nesting_quotes = ['`'] " For code blocks

" Activate syntax options.
let g:markdown_fenced_languages = ['sh', 'vim', 'javascript', 'python', 'rust', 'solidity']
let b:undo_ftplugin .= '|unlet g:markdown_fenced_languages'
