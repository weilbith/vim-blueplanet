" Options
let g:startify_session_dir = g:data_folder_session
let g:startify_list_order = [
            \ ['Recently used files:'], 'files',
            \ ['Recently used files in this directory:'], 'dir',
            \ ['Sessions:'], 'sessions',
            \ ['Bookmarks:'], 'bookmarks']

let g:startify_custom_header = [
      \ ' /$$$$$$$  /$$                           /$$$$$$$  /$$                                 /$$    ',
      \ '| $$__  $$| $$                          | $$__  $$| $$                                | $$    ',
      \ '| $$  \ $$| $$ /$$   /$$  /$$$$$$       | $$  \ $$| $$  /$$$$$$  /$$$$$$$   /$$$$$$  /$$$$$$  ',
      \ '| $$$$$$$ | $$| $$  | $$ /$$__  $$      | $$$$$$$/| $$ |____  $$| $$__  $$ /$$__  $$|_  $$_/  ',
      \ '| $$__  $$| $$| $$  | $$| $$$$$$$$      | $$____/ | $$  /$$$$$$$| $$  \ $$| $$$$$$$$  | $$    ',
      \ '| $$  \ $$| $$| $$  | $$| $$_____/      | $$      | $$ /$$__  $$| $$  | $$| $$_____/  | $$ /$$',
      \ '| $$$$$$$/| $$|  $$$$$$/|  $$$$$$$      | $$      | $$|  $$$$$$$| $$  | $$|  $$$$$$$  |  $$$$/',
      \ '|_______/ |__/ \______/  \_______/      |__/      |__/ \_______/|__/  |__/ \_______/   \___/  ']


" Colors
highlight StartifyHeader  ctermfg=24 guifg=#005f87
highlight StartifyFooter  ctermfg=24 guifg=#005f87
highlight StartifySection ctermfg=24 guifg=#005f87
highlight StartifyNumber  ctermfg=38 guifg=#00afd7
highlight StartifyBracket ctermfg=24 guifg=#005f87
highlight StartifyPath    ctermfg=32 guifg=#0087d7
highlight StartifySlash   ctermfg=38 guifg=#00afd7
highlight StartifyFile    ctermfg=81 guifg=#5fd7ff
highlight StartifySpecial ctermfg=197 guifg=#ff005f


" Use Dev-Icons
function! StartifyEntryFormat()
    return 'WebDevIconsGetFileTypeSymbol(absolute_path) ." ". entry_path'
endfunction
