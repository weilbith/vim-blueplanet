let bufferline = {}
let bufferline.semantic_letters = v:false

highlight! link BufferCurrent        Pmenu
highlight! link BufferCurrentMod     GreenBold
highlight! link BufferCurrentSign    BufferCurrent
" highlight! link BufferCurrentTarget
highlight! link BufferInactive       NormalInactive
highlight! link BufferInactiveMod    BufferCurrentMod
highlight! link BufferInactiveSign   BufferInactive
" highlight! link BufferInactiveTarget BufferCurrentTarget
highlight! link BufferVisible        BufferInactive
highlight! link BufferVisibleMod     BufferCurrentMod
highlight! link BufferVisibleSign    BufferVisible
" highlight! link BufferVisibleTarget  BufferInactiveTarget
highlight! link BufferTabpages       RedBackground
