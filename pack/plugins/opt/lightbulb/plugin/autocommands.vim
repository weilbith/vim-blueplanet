augroup LightBulb
	autocmd!
	autocmd CursorHold,CursorHoldI * lua require('nvim-lightbulb').update_lightbulb({
				\   sign = {
				\     enabled = false,
				\   },
				\   float = {
				\     enabled = true,
				\     text = '',
				\			win_opts = {
				\			  winblend = 60,
				\     },
				\   },
				\ })
augroup END
