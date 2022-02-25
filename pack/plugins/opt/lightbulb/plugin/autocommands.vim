augroup LightBulb
	autocmd!
  autocmd CursorHold,CursorHoldI * lua require('nvim-lightbulb').update_lightbulb()
augroup END
