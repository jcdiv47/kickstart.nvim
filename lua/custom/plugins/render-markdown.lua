return {
  'MeanderingProgrammer/render-markdown.nvim',
  enabled = true,
  dependencies = {
    'nvim-treesitter/nvim-treesitter',
    'nvim-tree/nvim-web-devicons',
  },
  ---@module 'render-markdown'
  ft = { 'markdown' },
  config = function()
    -- Define colors
    local color1_bg = '#ff757f'
    local color2_bg = '#4fd6be'
    local color3_bg = '#7dcfff'
    local color4_bg = '#ff9e64'
    local color5_bg = '#7aa2f7'
    local color6_bg = '#c0caf5'
    local color_fg = '#1F2335'

    -- Heading background
    vim.cmd(string.format([[highlight Headline1Bg guifg=%s guibg=%s gui=bold]], color_fg, color1_bg))
    vim.cmd(string.format([[highlight Headline2Bg guifg=%s guibg=%s gui=bold]], color_fg, color2_bg))
    vim.cmd(string.format([[highlight Headline3Bg guifg=%s guibg=%s gui=bold]], color_fg, color3_bg))
    vim.cmd(string.format([[highlight Headline4Bg guifg=%s guibg=%s gui=bold]], color_fg, color4_bg))
    vim.cmd(string.format([[highlight Headline5Bg guifg=%s guibg=%s gui=bold]], color_fg, color5_bg))
    vim.cmd(string.format([[highlight Headline6Bg guifg=%s guibg=%s gui=bold]], color_fg, color6_bg))

    -- Heading fg
    -- vim.cmd(string.format([[highlight Headline1Fg guifg=%s gui=bold]], colors.color1_bg))
    -- vim.cmd(string.format([[highlight Headline2Fg guifg=%s gui=bold]], colors.color2_bg))
    -- vim.cmd(string.format([[highlight Headline3Fg guifg=%s gui=bold]], colors.color3_bg))
    -- vim.cmd(string.format([[highlight Headline4Fg guifg=%s gui=bold]], colors.color4_bg))
    -- vim.cmd(string.format([[highlight Headline5Fg guifg=%s gui=bold]], colors.color5_bg))
    -- vim.cmd(string.format([[highlight Headline6Fg guifg=%s gui=bold]], colors.color6_bg))

    require('render-markdown').setup {
      completions = { lsp = { enabled = true } },
      heading = {
        setext = false,
        sign = false,
        right_pad = 1,
        width = 'block',
        icons = { '󰎤 ', '󰎧 ', '󰎪 ', '󰎭 ', '󰎱 ', '󰎳 ' },
        backgrounds = {
          'Headline1Bg',
          'Headline2Bg',
          'Headline3Bg',
          'Headline4Bg',
          'Headline5Bg',
          'Headline6Bg',
        },
        foregrounds = {
          'Headline1Fg',
          'Headline2Fg',
          'Headline3Fg',
          'Headline4Fg',
          'Headline5Fg',
          'Headline6Fg',
        },
      },
      code = {
        sign = false,
        width = 'block',
        right_pad = 1,
      },
      bullet = {
        -- Turn on / off list bullet rendering
        enabled = true,
      },
      dash = {
        enabled = false,
      },
    }
  end,
}
