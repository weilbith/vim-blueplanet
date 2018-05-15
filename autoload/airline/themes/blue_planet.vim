"
"  /$$$$$$$  /$$                           /$$$$$$$  /$$                                 /$$    
" | $$__  $$| $$                          | $$__  $$| $$                                | $$    
" | $$  \ $$| $$ /$$   /$$  /$$$$$$       | $$  \ $$| $$  /$$$$$$  /$$$$$$$   /$$$$$$  /$$$$$$  
" | $$$$$$$ | $$| $$  | $$ /$$__  $$      | $$$$$$$/| $$ |____  $$| $$__  $$ /$$__  $$|_  $$_/  
" | $$__  $$| $$| $$  | $$| $$$$$$$$      | $$____/ | $$  /$$$$$$$| $$  \ $$| $$$$$$$$  | $$    
" | $$  \ $$| $$| $$  | $$| $$_____/      | $$      | $$ /$$__  $$| $$  | $$| $$_____/  | $$ /$$
" | $$$$$$$/| $$|  $$$$$$/|  $$$$$$$      | $$      | $$|  $$$$$$$| $$  | $$|  $$$$$$$  |  $$$$/
" |_______/ |__/ \______/  \_______/      |__/      |__/ \_______/|__/  |__/ \_______/   \___/  
"
" Theme:    Blue-Planet
" Author:   Thore Weilbier (thore@weilbier.net)
" License:  MIT
"
" Based on the vim color scheme with the same name.
"
" The theme require 256 colors for the terminal version or for Vim run in a GUI (cause the upper theme need so).
"
" Why blue_planet u ask? Cause some day I start to customize all CLI tools and use with the same colors palette,
" which base on my awesome [wallpaper](http://wallpaper-gallery.net/images/wallpaper-hd-planet/wallpaper-hd-planet-22.jpg).
" Similar themes exist for i3, tmux, powerstatus10k, powerlevel9k, midnight commander, weechat, cmus, ...

" Define the base colors.
let s:ctermWhite="15"
let s:guiWhite="#ffffff"

let s:ctermBlack="16"
let s:guiBlack="#000000"

let s:ctermSteelBlue1="81"
let s:guiSteelBlue1="#5fd7ff"

let s:ctermDeepSkyBlue4="24"
let s:guiDeepSkyBlue4="#004f87"

let s:ctermDeepSkyBlue3="32"
let s:guiDeepSkyBlue3="#0087d7"

let s:ctermDeepSkyBlue2="38"
let s:guiDeepSkyBlue2="#00afd7"

let s:ctermDarkOliveGreen1="191"
let s:guiDarkOliveGreen1="#d7ff5f"

let s:ctermDeepPink2="197"
let s:guiDeepPink2="#ff005f"


" Compose colors for sections.
" Also used for mode 'normal'.
let s:airline_a=[s:guiWhite, s:guiDeepSkyBlue3, s:ctermWhite, s:ctermDeepSkyBlue3]
let s:airline_b=[s:guiWhite, s:guiDeepSkyBlue2, s:ctermWhite, s:ctermDeepSkyBlue2]
let s:airline_c=[s:guiWhite, s:guiDeepSkyBlue4, s:ctermWhite, s:ctermDeepSkyBlue4]
let s:airline_x=[s:guiBlack, s:guiSteelBlue1,   s:ctermBlack, s:ctermSteelBlue1]
let s:airline_y=[s:guiWhite, s:guiDeepSkyBlue2, s:ctermWhite, s:ctermDeepSkyBlue2]
let s:airline_z=[s:guiWhite, s:guiDeepSkyBlue3, s:ctermWhite, s:ctermDeepSkyBlue3]

" For mode 'insert'
let s:airline_a_insert=[s:guiBlack, s:guiDarkOliveGreen1, s:ctermBlack, s:ctermDarkOliveGreen1]

" For mode 'visual'
let s:airline_a_visual=[s:guiWhite, s:guiDeepPink2, s:ctermWhite, s:ctermDeepPink2]

" For inactive windows
let s:airline_inactive=[s:guiWhite, s:guiDeepSkyBlue4, s:ctermWhite, s:ctermDeepSkyBlue4]


" Define the palette.
let g:airline#themes#blue_planet#palette = {}

let g:airline#themes#blue_planet#palette.normal = {
      \ 'airline_a': s:airline_a,
      \ 'airline_b': s:airline_b,
      \ 'airline_c': s:airline_c,
      \ 'airline_x': s:airline_x,
      \ 'airline_y': s:airline_y,
      \ 'airline_z': s:airline_z
      \}

let g:airline#themes#blue_planet#palette.insert = {
      \ 'airline_a': s:airline_a_insert,
      \ 'airline_b': s:airline_b,
      \ 'airline_c': s:airline_c,
      \ 'airline_x': s:airline_x,
      \ 'airline_y': s:airline_y,
      \ 'airline_z': s:airline_z
      \}

let g:airline#themes#blue_planet#palette.visual = {
      \ 'airline_a': s:airline_a_visual,
      \ 'airline_b': s:airline_b,
      \ 'airline_c': s:airline_c,
      \ 'airline_x': s:airline_x,
      \ 'airline_y': s:airline_y,
      \ 'airline_z': s:airline_z
      \}

let g:airline#themes#blue_planet#palette.inactive = {
      \ 'airline_a': s:airline_inactive,
      \ 'airline_b': s:airline_inactive,
      \ 'airline_c': s:airline_inactive,
      \ 'airline_x': s:airline_inactive,
      \ 'airline_y': s:airline_inactive,
      \ 'airline_z': s:airline_inactive
      \}

let g:airline#themes#blue_planet#palette.inactive_modified = {
      \ 'airline_a': s:airline_inactive,
      \ 'airline_b': s:airline_inactive,
      \ 'airline_c': s:airline_inactive,
      \ 'airline_x': s:airline_inactive,
      \ 'airline_y': s:airline_inactive,
      \ 'airline_z': s:airline_inactive
      \}


" Symbols
let g:airline_symbols.linenr=''
let g:airline_symbols.maxlinenr=' Ξ'
let g:airline_symbols.spell=' '
let g:airline_symbols.paste='Þ'
let g:airline_symbols.modified=' [+] '
let g:airline_symbols.space=' '
let g:airline_symbols.readonly='  '
let g:airline_symbols.branch=''


" Tabline
let g:airline#themes#blue_planet#palette.tabline = {
      \ 'airline_tab':      s:airline_a,
      \ 'airline_tabsel':   s:airline_x,
      \ 'airline_tabtype':  s:airline_a_visual,
      \ 'airline_tabfill':  s:airline_c,
      \ 'airline_tabmod':   s:airline_a_insert,
      \ 'airline_tabhid':   s:airline_a
      \} 

" " warnings
" let g:airline#themes#blue_planet#palette.normal.airline_warning = s:wi
" let g:airline#themes#blue_planet#palette.insert.airline_warning = s:wi
" let g:airline#themes#blue_planet#palette.visual.airline_warning = s:wi
" let g:airline#themes#blue_planet#palette.replace.airline_warning = s:wi
" 
" 
" " mode map
" let g:airline_mode_map = {
"   \ '__' : '--',
"   \ 'n'  : 'n',
"   \ 'i'  : 'i',
"   \ 'r'  : 'r',
"   \ 'c'  : 'c',
"   \ 'v'  : 'v',
"   \ 'v'  : 'v-l',
"   \ '' : 'v-b',
"   \ 's'  : 's',
"   \ 's'  : 's-l',
"   \ '' : 's-b',
"   \ 't'  : 't',
"   \ }
" 
"
" " Accents
" let g:airline#themes#behelit#palette.accents = {
"       \ 'red': [ '#d7005f', '', 161, '' ]
"       \ }
