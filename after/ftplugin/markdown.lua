local set = vim.opt_local

set.textwidth = 90
set.wrap = true
set.linebreak = true

vim.keymap.set('n', '<leader>m', '<cmd>Markview toggle<CR>', { buffer = true, desc = 'Markview Toggle' })
