-- directly copied from https://github.com/tonybanters/nvim/blob/db83c748143ac8a9e8c2ee90611ac3a8527b3b2d/lua/plugins/harpoon.lua
local conf = require('telescope.config').values
local themes = require 'telescope.themes'

-- helper function to use telescope on harpoon list.
-- change get_ivy to other themes if wanted
local function toggle_telescope(harpoon_files)
  local file_paths = {}
  for _, item in ipairs(harpoon_files.items) do
    table.insert(file_paths, item.value)
  end
  local opts = themes.get_ivy {
    promt_title = 'Working List',
  }

  require('telescope.pickers')
    .new(opts, {
      finder = require('telescope.finders').new_table {
        results = file_paths,
      },
      previewer = conf.file_previewer(opts),
      sorter = conf.generic_sorter(opts),
    })
    :find()
end

return {
  'ThePrimeagen/harpoon',
  branch = 'harpoon2',
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  config = function()
    local harpoon = require 'harpoon'

    -- REQUIRED
    harpoon:setup()
    -- REQUIRED

    local function bufferInHarpoonList()
      local relative_path = vim.fn.fnamemodify(vim.fn.expand '%:p', ':~:.')
      for _, item in ipairs(harpoon:list().items) do
        if relative_path == item.value then
          return true
        end
      end
      return false
    end

    vim.keymap.set('n', '<leader>a', function()
      -- First check if current buffer is already added to Harpoon.
      local inHarpoonList = bufferInHarpoonList()
      -- Regardless, still add the buffer(in case the previous logic is false positive).
      harpoon:list():add()
      if not inHarpoonList then -- Notify only when newly added.
        require 'notify'('Added buffer to Harpoon.', vim.log.levels.INFO, { render = 'wrapped-compact', title = 'Harpoon' })
      end
    end, { desc = 'Add a buffer to Harpoon' })
    vim.keymap.set('n', '<C-e>', function()
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end, { desc = 'Toggle quick menu for Harpoon' })
    vim.keymap.set('n', '<leader>H', function()
      toggle_telescope(harpoon:list())
    end, { desc = 'Open harpoon floating window' })
    vim.keymap.set('n', '<C-p>', function()
      harpoon:list():prev()
    end, { desc = 'Go to previous buffer on Harpoon list' })
    vim.keymap.set('n', '<C-n>', function()
      harpoon:list():next()
    end, { desc = 'Go to next buffer on Harpoon list' })
  end,
}
