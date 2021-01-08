lua packer.use({
    \   'wellle/targets.vim',
    \   event = 'BufEnter',
    \ })

" Note: There are way too many operator mappings to lazy load this based on
" mappings. Therefore the event must be efficient enough.
