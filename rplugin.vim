" node plugins


" python3 plugins
call remote#host#RegisterPlugin('python3', '/home/thore/.cache/dein/repos/github.com/Shougo/denite.nvim/rplugin/python3/denite', [
      \ {'sync': v:true, 'name': '_denite_init', 'type': 'function', 'opts': {}},
      \ {'sync': v:true, 'name': '_denite_start', 'type': 'function', 'opts': {}},
      \ {'sync': v:true, 'name': '_denite_do_action', 'type': 'function', 'opts': {}},
     \ ])
call remote#host#RegisterPlugin('python3', '/home/thore/.cache/dein/repos/github.com/Shougo/deoplete.nvim/rplugin/python3/deoplete', [
      \ {'sync': v:false, 'name': '_deoplete_init', 'type': 'function', 'opts': {}},
     \ ])
call remote#host#RegisterPlugin('python3', '/home/thore/.cache/dein/repos/github.com/brooth/far.vim/rplugin/python3/far', [
      \ {'sync': v:false, 'name': '_far_nvim_rpc_async_invoke', 'type': 'function', 'opts': {}},
     \ ])


" ruby plugins


" python plugins


