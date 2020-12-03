call wilder#enable_cmdline_enter()

set wildcharm=<Tab>

cmap <expr> <Tab> wilder#in_context() ? wilder#next() : "\<Tab>"
cmap <expr> <S-Tab> wilder#in_context() ? wilder#previous() : "\<S-Tab>"

call wilder#set_option('modes', ['/', '?', ':'])
call wilder#set_option('renderer', wilder#float_renderer({
      \   'separator': ' • ',
      \   'separator_hl': 'Grey',
      \   'hl': 'GreenBold',
      \   'left': [
      \     {
      \       'value': [
      \         wilder#condition(
      \           { -> getcmdtype() ==# ':' },
      \           ' COMMAND ',
      \           ' SEARCH '
      \         ),
      \         wilder#spinner({
      \           'frames': ['⠋', '⠙', '⠹', '⠸', '⠼', '⠴', '⠦', '⠧', '⠇', '⠏'],
      \         }),
      \         '',
      \       ],
      \       'hl': 'RedBackground',
      \     },
      \     ' ',
      \   ],
      \   'right': [
      \     ' ',
      \     wilder#index({ 'hl': 'YellowBold' }),
      \   ],
      \ }))
