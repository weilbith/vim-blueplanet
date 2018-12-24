scriptencoding utf-8

let g:lightline = {}

let g:lightline.enable = { 'statusline': 1, 'tabline': 1 }

" Style
let g:lightline.colorscheme          = 'blue_planet'
let g:lightline.separator            = { 'left': '', 'right': '' }
let g:lightline.subseparator         = { 'left': '', 'right': '' }
let g:lightline.tabline_separator    = { 'left': '', 'right': '' }
let g:lightline.tabline_subseparator = { 'left': '', 'right': '' }

" Mode Map
let g:lightline.mode_map = {}
let g:lightline.mode_map['n']      = 'Normal'
let g:lightline.mode_map['i']      = 'Insert'
let g:lightline.mode_map['R']      = 'Replace'
let g:lightline.mode_map['v']      = 'Visual'
let g:lightline.mode_map['V']      = 'V-Line'
let g:lightline.mode_map['\<C-v>'] = 'V-Block'
let g:lightline.mode_map['c']      = 'Command'
let g:lightline.mode_map['s']      = 'Select'
let g:lightline.mode_map['S']      = 'S-Line'
let g:lightline.mode_map['\<C-s>'] = 'S-Block'
let g:lightline.mode_map['t']      = 'Terminal'

" Segments
"" Status Line
""" Active
let g:lightline.active        = {}
let g:lightline.active.left   = [
      \   [ 'mode' ],
      \   [ 'git_branch', 'git_changes' ],
      \   [ 'filename', 'tags_status', 'modified', 'read_only' ]
      \ ]

let g:lightline.active.right  = [
      \   [ 'position' ],
      \   [ 'spell' ],
      \   [ 'file_format', 'file_type', 'fileencoding'],
      \   [ 'linter_status' ]
      \ ]

""" Inactive
let g:lightline.inactive        = {}
let g:lightline.inactive.left   = [ [ 'window_number', 'filename' ] ]
let g:lightline.inactive.right  = [ [ 'file_format', 'file_type', 'fileencoding' ] ]


"" Tab Line
let g:lightline.tabline      = {}
let g:lightline.tabline.left = [ [ 'tabs' ] ]
let g:lightline.tabline.left = [ ]

""" Tab
let g:lightline.tab          = {}
let g:lightline.tab.active   = [ 'tabnum', 'filename', 'modified' ]
let g:lightline.tab.inactive = g:lightline.tab.active


" Segment Definitions
"" Components
""" Definition
let g:lightline.component = {}
let g:lightline.component.window_number = ' %{winnr()}'
let g:lightline.component.git_branch    = ' %{fugitive#head()}'
let g:lightline.component.spell         = '%{&spelllang . " ﬜" . (&spell ? " " : " ")}'
let g:lightline.component.position      = '%l/%L '
let g:lightline.component.file_type     = '%{&filetype} %{WebDevIconsGetFileTypeSymbol()}'
let g:lightline.component.file_format   = '%{&fileformat} %{WebDevIconsGetFileFormatSymbol()}'

""" Expands
let g:lightline.component_expand = {}
let g:lightline.component_expand.paste_enabled = 'plugin#lightline#paste_enabled'
let g:lightline.component_expand.modified      = 'plugin#lightline#modified'
let g:lightline.component_expand.read_only     = 'plugin#lightline#read_only'
let g:lightline.component_expand.linter_status = 'plugin#lightline#linter_status'

""" Type
let g:lightline.component_type = {}
let g:lightline.component_type.paste_enabled = 'hint'
let g:lightline.component_type.modified      = 'hint'
let g:lightline.component_type.read_only     = 'warning'
let g:lightline.component_type.linter_status = 'warning'


"" Functions
let g:lightline.component_function = {}
let g:lightline.component_function.git_changes    = 'plugin#lightline#git_changes'
let g:lightline.component_function.tags_status    = 'plugin#lightline#tags_status'
