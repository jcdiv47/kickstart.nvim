---@diagnostic disable
return {
  'folke/snacks.nvim',
  -- Dashboard appears to show up only with the following two lines
  priority = 999,
  lazy = false,
  ---@type snacks.Config
  opts = {
    dashboard = {
      -- your dashboard configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
      sections = {
        { section = 'header' },
        { icon = ' ', title = 'Keymaps', section = 'keys', indent = 2, padding = 1 },
        { icon = ' ', title = 'Recent Files', section = 'recent_files', indent = 2, padding = 1 },
        { icon = ' ', title = 'Projects', section = 'projects', indent = 2, padding = 1 },
        { section = 'startup' },
      },
    },
    picker = {},
    explorer = {},
    scroll = { enabled = true },
  },
  vim.keymap.set('n', '<leader>bd', function()
    Snacks.bufdelete()
  end, { desc = 'Snacks Delete Buffer' }),
  vim.keymap.set('n', '<leader>gd', function()
    Snacks.picker.git_diff()
  end, { desc = 'Git Diff (Hunks)' }),
  vim.keymap.set('n', '<leader>gs', function()
    Snacks.picker.git_status()
  end, { desc = 'Git Status' }),
  vim.keymap.set('n', '<leader>u', function()
    Snacks.picker.undo()
  end, { desc = 'Snacks Undo History' }),
  vim.keymap.set({ 'n', 't' }, '<A-i>', function()
    Snacks.terminal()
  end, { desc = 'Snacks Toggle Terminal' }),
  vim.keymap.set('n', '<leader>sl', function()
    Snacks.picker.lines()
  end, { desc = 'Buffer Lines' }),
  vim.keymap.set('n', '<leader>st', function()
    Snacks.picker.todo_comments()
  end, { desc = 'Todo' }),
  vim.keymap.set('n', '<leader>sT', function()
    Snacks.picker.todo_comments { keywords = { 'TODO', 'FIX', 'FIXME' } }
  end, { desc = 'Todo/Fix/Fixme' }),
}
