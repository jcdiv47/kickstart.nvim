return {
  'AntonVanAssche/md-headers.nvim',
  version = '*',
  opts = {},
  ft = { 'markdown' }, -- Load only for markdown files.
  config = function()
    require('md-headers').setup {}
  end,
}
