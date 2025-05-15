return {
  'nvim-treesitter/nvim-treesitter-textobjects',
  -- lazy = true,
  event = { 'BufEnter' },
  config = function()
    ---@diagnostic disable-next-line
    require('nvim-treesitter.configs').setup {
      textobjects = {
        select = {
          enable = true,
          lookahead = true,
        },
        move = {
          enable = true,
          set_jumps = true,
          goto_next_start = {
            ['<leader>]f'] = { query = '@call.outer', desc = 'Next function call start' },
            ['<leader>]m'] = { query = '@function.outer', desc = 'Next method/function def start' },
            ['<leader>]c'] = { query = '@class.outer', desc = 'Next class start' },
            ['<leader>]i'] = { query = '@conditional.outer', desc = 'Next conditional start' },
            ['<leader>]l'] = { query = '@loop.outer', desc = 'Next loop start' },
          },
          goto_next_end = {
            ['<leader>]F'] = { query = '@call.outer', desc = 'Next function call end' },
            ['<leader>]M'] = { query = '@function.outer', desc = 'Next method/function def end' },
            ['<leader>]C'] = { query = '@class.outer', desc = 'Next class end' },
            ['<leader>]I'] = { query = '@conditional.outer', desc = 'Next conditional end' },
            ['<leader>]L'] = { query = '@loop.outer', desc = 'Next loop end' },
          },
          goto_previous_start = {
            ['<leader>[f'] = { query = '@call.outer', desc = 'Prev function call start' },
            ['<leader>[m'] = { query = '@function.outer', desc = 'Prev method/function def start' },
            ['<leader>[c'] = { query = '@class.outer', desc = 'Prev class start' },
            ['<leader>[i'] = { query = '@conditional.outer', desc = 'Prev conditional start' },
            ['<leader>[l'] = { query = '@loop.outer', desc = 'Prev loop start' },
          },
          goto_previous_end = {
            ['<leader>[F'] = { query = '@call.outer', desc = 'Prev function call end' },
            ['<leader>[M'] = { query = '@function.outer', desc = 'Prev method/function def end' },
            ['<leader>[C'] = { query = '@class.outer', desc = 'Prev class end' },
            ['<leader>[I'] = { query = '@conditional.outer', desc = 'Prev conditional end' },
            ['<leader>[L'] = { query = '@loop.outer', desc = 'Prev loop end' },
          },
        },
      },
    }
  end,
}
