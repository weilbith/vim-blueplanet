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
let s:ctermWhite='15'
let s:guiWhite='#ffffff'

let s:ctermBlack='16'
let s:guiBlack='#000000'

let s:ctermSteelBlue1='81'
let s:guiSteelBlue1='#5fd7ff'

let s:ctermDeepSkyBlue4='24'
let s:guiDeepSkyBlue4='#004f87'

let s:ctermDeepSkyBlue3='32'
let s:guiDeepSkyBlue3='#0087d7'

let s:ctermDeepSkyBlue2='38'
let s:guiDeepSkyBlue2='#00afd7'

let s:ctermDarkOliveGreen1='191'
let s:guiDarkOliveGreen1='#d7ff5f'

let s:ctermDeepPink2='197'
let s:guiDeepPink2='#ff005f'


" Define the palette.
let s:palette = {}

" Reusable color lists.
let s:inactive_a = [ s:guiWhite, s:guiDeepSkyBlue4,    s:ctermWhite, s:ctermDeepSkyBlue4    ] 
let s:normal_a   = [ s:guiWhite, s:guiDeepSkyBlue3,    s:ctermWhite, s:ctermDeepSkyBlue3    ] 
let s:normal_b   = [ s:guiWhite, s:guiDeepSkyBlue2,    s:ctermWhite, s:ctermDeepSkyBlue2    ] 
let s:normal_c   = [ s:guiBlack, s:guiSteelBlue1,      s:ctermBlack, s:ctermSteelBlue1      ] 
let s:normal_d   = [ s:guiWhite, s:guiDeepSkyBlue4,    s:ctermWhite, s:ctermDeepSkyBlue4    ] 
let s:insert_a   = [ s:guiBlack, s:guiDarkOliveGreen1, s:ctermBlack, s:ctermDarkOliveGreen1 ]
let s:visual_a   = [ s:guiWhite, s:guiDeepPink2,       s:ctermWhite, s:ctermDeepPink2       ]


" Status Line
"" Inactive
let s:palette.inactive        = {}
let s:palette.inactive.left   = [ s:inactive_a, s:inactive_a, s:inactive_a ]
let s:palette.inactive.middle = [ s:inactive_a ]
let s:palette.inactive.right  = s:palette.inactive.left

"" Active Modes
""" Normal
let s:palette.normal        = {}
let s:palette.normal.left   = [ s:normal_a, s:normal_b, s:normal_c, 'bold' ]
let s:palette.normal.middle = [ s:normal_d ]
let s:palette.normal.right  = s:palette.normal.left[:2]

""" Insert
let s:palette.insert        = {}
let s:palette.insert.left   = [ s:insert_a, s:normal_b, s:normal_c, 'bold']
let s:palette.insert.middle = s:palette.normal.middle
let s:palette.insert.right  = s:palette.normal.left[:2]

""" Visual
let s:palette.visual        = {}
let s:palette.visual.left   = [ s:visual_a, s:normal_b, s:normal_c, 'bold' ]
let s:palette.visual.middle = s:palette.normal.middle
let s:palette.visual.right  = s:palette.normal.left[:2]
 
 
"" Special Colors
let s:palette.normal.hint    = [ s:insert_a + [ 'bold' ] ]
let s:palette.normal.warning = [ s:visual_a + [ 'bold' ] ]
 
 
" Tab Line
let s:palette.tabline = {}
let s:palette.tabline.left = [ s:normal_a ]
let s:palette.tabline.tabsel = [ s:insert_a ]
let s:palette.tabline.middle = [ s:normal_d ]
let s:palette.tabline.right = [ s:normal_a ]


" Export palette
let g:lightline#colorscheme#blue_planet#palette = s:palette
