" Options
let g:startify_list_order = [
            \ ['Recently used files:'], 'files',
            \ ['Recently used files in this directory:'], 'dir',
            \ ['Bookmarks:'], 'bookmarks']

let g:startify_custom_header = [
      \ '     /$$   /$$                     /$$    /$$ /$$              ',
      \ '    | $$$ | $$                    | $$   | $$|__/              ',
      \ '    | $$$$| $$  /$$$$$$   /$$$$$$ | $$   | $$ /$$ /$$$$$$/$$$$ ',
      \ '    | $$ $$ $$ /$$__  $$ /$$__  $$|  $$ / $$/| $$| $$_  $$_  $$',
      \ '    | $$  $$$$| $$$$$$$$| $$  \ $$ \  $$ $$/ | $$| $$ \ $$ \ $$',
      \ '    | $$\  $$$| $$_____/| $$  | $$  \  $$$/  | $$| $$ | $$ | $$',
      \ '    | $$ \  $$|  $$$$$$$|  $$$$$$/   \  $/   | $$| $$ | $$ | $$',
      \ '    |__/  \__/ \_______/ \______/     \_/    |__/|__/ |__/ |__/',
      \ ]


highlight! link StartifyBracket Grey
highlight! link StartifyFile Green
highlight! link StartifyNumber Orange
highlight! link StartifyPath Blue
highlight! link StartifySlash Blue
highlight! link StartifySection Purple
highlight! link StartifyHeader Red
highlight! link StartifySpecial Orange


" Use Dev-Icons
function! StartifyEntryFormat()
    return 'WebDevIconsGetFileTypeSymbol(absolute_path) ." ". entry_path'
endfunction
