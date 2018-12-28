scriptencoding utf-8

let g:UltiSnipsEditSplit = 'context'
let g:UltiSnipsSnippetsDir = g:base_folder . '/snippet'
let g:UltiSnipsSnippetDirectories = [ g:UltiSnipsSnippetsDir ]
let g:UltiSnipsEnableSnipMate = 0

" Disable default mappings.
let g:UltiSnipsExpandTrigger = '<nop>'
let g:UltiSnipsListSnippets = '<nop>'
let g:UltiSnipsJumpForwardTrigger = '<nop>'
let g:UltiSnipsJumpBackwardTrigger = '<nop>'


" Set custom deoplete related source options.
" call deoplete#custom#source('ultisnips', 'rank', 650)
" call deoplete#custom#source('ultisnips', 'mark', '')
