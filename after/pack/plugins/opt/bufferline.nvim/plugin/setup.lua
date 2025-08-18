vim.cmd.packadd('nvim-web-devicons')

        for _, buffer_number in ipairs(all_buffer_numbers) do
          if vim.api.nvim_get_option_value('buflisted', { buf = buffer_number }) then
            number_of_loaded_buffers = number_of_loaded_buffers + 1
          end
        end

        local text = ' ' .. number_of_loaded_buffers
        return { { text = text, gui = 'bold' } }
      end,
    },
  },
})
