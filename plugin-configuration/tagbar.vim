scriptencoding utf-8

let g:tagbar_width = 25
let g:tagbar_iconchars = ['▶','▼']
let g:tagbar_zoomwidth = 0
let g:tagbar_compact = 1
let g:tagbar_autoshowtag = 1
let g:tagbar_autopreview  =  1
let g:tagbar_map_showproto = 'a' " Else my default <leader> doesn't work.
let g:tagbar_sort = 0

" Extended filetype support.
let g:tagbar_type_markdown = {
      \ 'ctagstype': 'markdown',
      \ 'ctagsbin': '$HOME/Tools/markdown2ctags/markdown2ctags.py',
      \ 'ctagsargs': '-f - --sort=yes --sro="|"',
      \ 'kinds': [
      \   's:sections',
      \   'i:images'
      \ ],
      \ 'sro': '|',
      \ 'kind2scope': {
      \   's': 'section',
      \ },
      \ 'sort': 0,
      \ }

" let g:tagbar_type_solidity = {
"       \ 'ctagstype': 'Solidity',
"       \ 'kinds': [
"       \   'c:contract',
"       \   'f,function',
"       \   'e,event',
"       \   'v,variable',
"       \   'm,mapping'
"       \ ]}

" Has further mappings in the section toggle.
