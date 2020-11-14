scriptencoding utf-8

let g:lightline = {}

let g:lightline.enable = { 'statusline': 1, 'tabline': 1 }

" Style
let g:lightline.colorscheme          = 'blue_planet'
let g:lightline.separator            = { 'left': '', 'right': '' }
let g:lightline.subseparator         = { 'left': '', 'right': '' }
let g:lightline.tabline_separator    = { 'left': '', 'right': '' }
let g:lightline.tabline_subseparator = { 'left': '', 'right': '' }

" Mode Map
let g:lightline.mode_map = {}
let g:lightline.mode_map['n']      = '  '
let g:lightline.mode_map['i']      = '  '
let g:lightline.mode_map['R']      = '  '
let g:lightline.mode_map['v']      = '  '
let g:lightline.mode_map['V']      = '  '
let g:lightline.mode_map['\<C-v>'] = '  '
let g:lightline.mode_map['c']      = 'Command'
let g:lightline.mode_map['s']      = '  '
let g:lightline.mode_map['S']      = 'S-Line'
let g:lightline.mode_map['\<C-s>'] = 'S-Block'
let g:lightline.mode_map['t']      = 'Terminal'

" Segments
"" Status Line
""" Active
let g:lightline.active = {}
let g:lightline.active.left = [
      \   [ 'mode' ],
      \   [ 'git_branch', 'git_changes' ],
      \   [ 'diff_mode', 'file_name_active', 'treesitter', 'tags_status', 'modified', 'read_only' ],
      \ ]

let g:lightline.active.right = [
      \   [ 'position' ],
      \   [ 'spell' ],
      \   [ 'file_format', 'file_type', 'file_encoding', 'diagnostics'],
      \ ]

""" Inactive
let g:lightline.inactive = {}
let g:lightline.inactive.left  = [ [ 'window_number', 'diff_mode', 'file_name_inactive' ] ]
let g:lightline.inactive.right = [ ]


"" Tab Line
let g:lightline.tabline = {}
let g:lightline.tabline.left  = [ [ 'buffers' ] ]
let g:lightline.tabline.right = [ [ 'tabs' ] ]

""" Buffer
let g:lightline#bufferline#modified          = ' '
let g:lightline#bufferline#read_only         = ' '
let g:lightline#bufferline#unnamed           = 'No Name'
let g:lightline#bufferline#min_buffer_count  = 2
let g:lightline#bufferline#shorten_path      = 1
let g:lightline#bufferline#show_number       = 2
let g:lightline#bufferline#enable_devicons   = 1
let g:lightline#bufferline#number_map        = plugin#lightline#number_map

""" Tab
let g:lightline.tab = {}
let g:lightline.tab.active   = [ 'tabnum', 'tab_name' ]
let g:lightline.tab.inactive = g:lightline.tab.active


" Segment Definitions
""" Components

""" Expand Components
let g:lightline.component_expand = {}
let g:lightline.component_expand.diff_mode     = 'plugin#lightline#diff_mode'
let g:lightline.component_expand.modified      = 'plugin#lightline#modified'
let g:lightline.component_expand.read_only     = 'plugin#lightline#read_only'
let g:lightline.component_expand.diagnostics   = 'plugin#lightline#diagnostics'
let g:lightline.component_expand.buffers       = 'lightline#bufferline#buffers'

"" Function Components
let g:lightline.component_function = {}
let g:lightline.component_function.window_number      = 'plugin#lightline#window_number'
let g:lightline.component_function.mode               = 'plugin#lightline#mode'
let g:lightline.component_function.git_branch         = 'plugin#lightline#git_branch'
let g:lightline.component_function.git_changes        = 'plugin#lightline#git_changes'
let g:lightline.component_function.file_name_active   = 'plugin#lightline#file_name_active'
let g:lightline.component_function.file_name_inactive = 'plugin#lightline#file_name_inactive'
let g:lightline.component_function.tags_status        = 'plugin#lightline#tags_status'
let g:lightline.component_function.treesitter         = 'plugin#lightline#treesitter'
let g:lightline.component_function.file_format        = 'plugin#lightline#file_format'
let g:lightline.component_function.file_type          = 'plugin#lightline#file_type'
let g:lightline.component_function.file_encoding      = 'plugin#lightline#file_encoding'
let g:lightline.component_function.spell              = 'plugin#lightline#spell'
let g:lightline.component_function.position           = 'plugin#lightline#position'

let g:lightline.tab_component_function = {}
let g:lightline.tab_component_function.tab_name = 'plugin#lightline#tab_name'


""" Type
let g:lightline.component_type = {}
let g:lightline.component_type.diff_mode     = 'hint'
let g:lightline.component_type.modified      = 'hint'
let g:lightline.component_type.read_only     = 'warning'
let g:lightline.component_type.tags_status   = 'hint'
let g:lightline.component_type.diagnostics   = 'warning'
let g:lightline.component_type.buffers       = 'tabsel'

""" Conditions
let g:lightline.component_visible_condition = {}
let g:lightline.component_visible_condition.window_number      = '!empty(plugin#lightline#window_number)'
let g:lightline.component_visible_condition.mode               = '!empty(plugin#lightline#mode)'
let g:lightline.component_visible_condition.git_branch         = '!empty(plugin#lightline#git_branch)'
let g:lightline.component_visible_condition.git_changes        = '!empty(plugin#lightline#git_changes)'
let g:lightline.component_visible_condition.file_name_active   = '!empty(plugin#lightline#file_name_active)'
let g:lightline.component_visible_condition.file_name_inactive = '!empty(plugin#lightline#file_name_inactive)'
let g:lightline.component_visible_condition.tags_status        = '!empty(plugin#lightline#tags_status)'
let g:lightline.component_visible_condition.treesitter         = '!empty(plugin#lightline#treesitter)'
let g:lightline.component_visible_condition.diagnostics        = '!empty(plugin#lightline#diagnostics)'
let g:lightline.component_visible_condition.file_format        = '!empty(plugin#lightline#file_format)'
let g:lightline.component_visible_condition.file_type          = '!empty(plugin#lightline#file_type)'
let g:lightline.component_visible_condition.file_encoding      = '!empty(plugin#lightline#file_encoding)'
let g:lightline.component_visible_condition.spell              = '!empty(plugin#lightline#spell)'
let g:lightline.component_visible_condition.position           = '!empty(plugin#lightline#position)'
