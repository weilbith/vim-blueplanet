" Basic configurations.
let g:neoformat_try_formatprg = 1 " Make use of ftplugin settings.
let g:neoformat_basic_format_trim = 1
let g:neoformat_basic_format_retab = 1
let g:neoformat_only_msg_on_error = 1

" Define list of enabled formatters for each file type.
let g:neoformat_enabled_java = ['uncrustify']
let g:neoformat_enabled_javascript = ['prettier']
let g:neoformat_enabled_typescript = ['prettier']
let g:neoformat_enabled_vue = ['prettier']
let g:neoformat_enabled_html = ['prettier']
let g:neoformat_enabled_less = ['prettier']
let g:neoformat_enabled_scss = ['prettier']
let g:neoformat_enabled_json = ['fixjson']
let g:neoformat_enabled_tex = ['latexindent']
