" Mappings
" Define current buffer as root file for PDF generation.
nnoremap <buffer> <silent> <localleader>r :<C-u>call <SID>setTexPdfRoot()<CR>
let b:undo_ftplugin .= '|nunmap <buffer> <localleader>r'

" Generate PDF document based on the defined root or the current buffer no
" such root exists.
nnoremap <buffer> <silent> <localleader>p :<C-u>Neomake pdflatex<CR>
let b:undo_ftplugin .= '|nunmap <buffer> <localleader>p'

" Toggle automatically PDF generation on buffer save.
nnoremap <buffer> <silent> <localleader>P :<C-u>call <SID>toggleAutoPdfGen()<CR>
let b:undo_ftplugin .= '|nunmap <buffer> <localleader>P'


" Omni completion patterns for Deoplete
if !exists('g:deoplete#omni#input_patterns')
  let g:deoplete#omni#input_patterns = {}
endif


let g:deoplete#omni#input_patterns.tex = '\\(?:'
      \ .  '\w*cite\w*(?:\s*\[[^]]*\]){0,2}\s*{[^}]*'
      \ . '|(text|block)cquote\*?(?:\s*\[[^]]*\]){0,2}\s*{[^}]*'
      \ . '|(for|hy)\w*cquote\*?{[^}]*}(?:\s*\[[^]]*\]){0,2}\s*{[^}]*'
      \ . '|\w*ref(?:\s*\{[^}]*|range\s*\{[^,}]*(?:}{)?)'
      \ . '|hyperref\s*\[[^]]*'
      \ . '|includegraphics\*?(?:\s*\[[^]]*\]){0,2}\s*\{[^}]*'
      \ . '|(?:include(?:only)?|input|subfile)\s*\{[^}]*'
      \ . '|\w*(gls|Gls|GLS)(pl)?\w*(\s*\[[^]]*\]){0,2}\s*\{[^}]*'
      \ . '|includepdf(\s*\[[^]]*\])?\s*\{[^}]*'
      \ . '|includestandalone(\s*\[[^]]*\])?\s*\{[^}]*'
      \ . '|(usepackage|RequirePackage|PassOptionsToPackage)(\s*\[[^]]*\])?\s*\{[^}]*'
      \ . '|documentclass(\s*\[[^]]*\])?\s*\{[^}]*'
      \ . '|begin(\s*\[[^]]*\])?\s*\{[^}]*'
      \ . '|end(\s*\[[^]]*\])?\s*\{[^}]*'
      \ . '|\w*'
      \ .')''}'

let b:undo_ftplugin .= '|unlet g:deoplete#omni#input_patterns'


" Functions

" Shared variable name to access.
let s:auto_pdf_gen_variable = 'auto_pdf_gen'
let b:undo_ftplugin .= '|unlet s:auto_pdf_gen_variable'

function! s:setTexPdfRoot() abort
  let g:neomake_pdflatex_cwd = expand('%:p:h')
  let g:neomake_pdflatex_append_file = 0
  let g:neomake_pdflatex_args = ['-shell-escape', '-file-line-error', '-interaction', 'nonstopmode', expand('%:p:t')]
  " Not able to expand the array here from the default configuration, cause
  " multiple calls would lead to an extension of the file list.

  let g:tex_pdf_auto = v:true
  echo 'Use ' . expand('%:p:t') . ' as new root for automatic PDF generation.'
endfunction

function! s:toggleAutoPdfGen()
  " Create toggle variable with default value true if not exist already.
  if !exists('g:' . s:auto_pdf_gen_variable)
    execute 'let g:' . s:auto_pdf_gen_variable . ' = 1'

  " Toggle the variable value.
  else
    execute 'let g:' . s:auto_pdf_gen_variable . ' = ' . !get(g:, s:auto_pdf_gen_variable)
  endif

  " Message to the user which mode.
  if get(g:, s:auto_pdf_gen_variable)
    echom 'Enable DPF autogeneration!'

  else
    echom 'Disable DPF autogeneration!'

  endif
endfunction


" Autocmd

augroup LatexPDFGeneration
  autocmd!
  autocmd! BufWritePost <buffer> if get(g:, s:auto_pdf_gen_variable, v:false) |
  \   execute 'Neomake pdflatex' |
  \ endif
augroup END
