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
      \   [ 'paste_enabled', 'diff_mode', 'file_name_active', 'tags_status', 'modified', 'read_only' ]
      \ ]

let g:lightline.active.right  = [
      \   [ 'position' ],
      \   [ 'spell' ],
      \   [ 'file_format', 'file_type', 'file_encoding'],
      \   [ 'linter_status' ]
      \ ]

""" Inactive
let g:lightline.inactive        = {}
let g:lightline.inactive.left   = [ [ 'window_number', 'diff_mode', 'file_name_inactive' ] ]
let g:lightline.inactive.right  = [ [ 'file_format', 'file_type', 'file_encoding' ] ]


"" Tab Line
let g:lightline.tabline      = {}
let g:lightline.tabline.left = [ [ 'tabs' ] ]
let g:lightline.tabline.left = [ ]

""" Tab
let g:lightline.tab          = {}
let g:lightline.tab.active   = [ 'tabnum', 'filename', 'modified' ]
let g:lightline.tab.inactive = g:lightline.tab.active


" Segment Definitions
""" Expands
let g:lightline.component_expand = {}
let g:lightline.component_expand.paste_enabled = 'plugin#lightline#paste_enabled'
let g:lightline.component_expand.diff_mode     = 'plugin#lightline#diff_mode'
let g:lightline.component_expand.modified      = 'plugin#lightline#modified'
let g:lightline.component_expand.read_only     = 'plugin#lightline#read_only'
let g:lightline.component_expand.linter_status = 'plugin#lightline#linter_status'

""" Type
let g:lightline.component_type = {}
let g:lightline.component_type.paste_enabled = 'hint'
let g:lightline.component_type.diff_mode     = 'hint'
let g:lightline.component_type.modified      = 'hint'
let g:lightline.component_type.read_only     = 'warning'
let g:lightline.component_type.linter_status = 'warning'

""" Conditions
let g:lightline.component_visible_condition = {}
let g:lightline.component_visible_condition.window_number      = '!empty(plugin#lightline#window_number)'
let g:lightline.component_visible_condition.mode               = '!empty(plugin#lightline#mode)'
let g:lightline.component_visible_condition.git_branch         = '!empty(plugin#lightline#git_branch)'
let g:lightline.component_visible_condition.git_changes        = '!empty(plugin#lightline#git_changes)'
let g:lightline.component_visible_condition.file_name_active   = '!empty(plugin#lightline#file_name_active)'
let g:lightline.component_visible_condition.file_name_inactive = '!empty(plugin#lightline#file_name_inactive)'
let g:lightline.component_visible_condition.tags_status        = '!empty(plugin#lightline#tags_status)'
let g:lightline.component_visible_condition.file_format        = '!empty(plugin#lightline#file_format)'
let g:lightline.component_visible_condition.file_type          = '!empty(plugin#lightline#file_type)'
let g:lightline.component_visible_condition.file_encoding      = '!empty(plugin#lightline#file_encoding)'
let g:lightline.component_visible_condition.spell              = '!empty(plugin#lightline#spell)'
let g:lightline.component_visible_condition.position           = '!empty(plugin#lightline#position)'


"" Functions
let g:lightline.component_function = {}
let g:lightline.component_function.window_number      = 'plugin#lightline#window_number'
let g:lightline.component_function.mode               = 'plugin#lightline#mode'
let g:lightline.component_function.git_branch         = 'plugin#lightline#git_branch'
let g:lightline.component_function.git_changes        = 'plugin#lightline#git_changes'
let g:lightline.component_function.file_name_active   = 'plugin#lightline#file_name_active'
let g:lightline.component_function.file_name_inactive = 'plugin#lightline#file_name_inactive'
let g:lightline.component_function.tags_status        = 'plugin#lightline#tags_status'
let g:lightline.component_function.file_format        = 'plugin#lightline#file_format'
let g:lightline.component_function.file_type          = 'plugin#lightline#file_type'
let g:lightline.component_function.file_encoding      = 'plugin#lightline#file_encoding'
let g:lightline.component_function.spell              = 'plugin#lightline#spell'
let g:lightline.component_function.position           = 'plugin#lightline#position'
