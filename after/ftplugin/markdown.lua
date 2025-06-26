local set = vim.opt_local

set.textwidth = 90
set.wrap = true
set.linebreak = true

-- [[ RenderMarkdown plugin keymaps ]]
vim.keymap.set('n', '<leader>rm', '<cmd>RenderMarkdown buf_toggle<CR>', { buffer = true, desc = 'Toggle Render Markdown for current buffer' })
vim.keymap.set('n', '<leader>rM', '<cmd>RenderMarkdown toggle<CR>', { buffer = true, desc = 'Toggle Render Markdown' })

-- [[ Md-headers plugin keymaps ]]
vim.keymap.set('n', '<leader>mh', '<cmd>MDHeaders<CR>', { buffer = true, silent = true, desc = 'Floating display for markdown headers' })
vim.keymap.set(
  'n',
  '<leader>mc',
  '<cmd>MDHeadersCurrent<CR>',
  { buffer = true, silent = true, desc = 'Floating display for markdown headers respecting current cursor location' }
)
vim.keymap.set('n', '<leader>mq', '<cmd>MDHeadersQuickfix<CR>', { buffer = true, silent = true, desc = 'Floating display for markdown headers in quickfix' })
vim.keymap.set('n', '<leader>mt', '<cmd>MDHeadersTelescope<CR>', { buffer = true, silent = true, desc = 'Floating display for markdown headers in Telescope' })

-- Navigating markdown headings
vim.keymap.set('n', ']]', '/^#\\+ <CR>')
vim.keymap.set('n', '[[', '?^#\\+ <CR>')

-- Automatically removes trailing spaces on every save
vim.api.nvim_create_autocmd('BufWritePre', {
  pattern = '*.md',
  callback = function()
    vim.cmd '%s/\\s\\+$//e'
  end,
})

-- Automatically change modified datetime in frontmatter on every save
vim.api.nvim_create_autocmd('BufWritePre', {
  pattern = '*.md',
  callback = function()
    local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
    local in_frontmatter = false
    local new_lines = {}
    local updated = false

    for _, line in ipairs(lines) do
      if line == '---' then
        if in_frontmatter then
          in_frontmatter = false
        else
          in_frontmatter = true
        end
        table.insert(new_lines, line)
      elseif in_frontmatter and line:match '^modified:' then
        local current_time = os.date '%Y-%m-%dT%H:%M:%S+08:00'
        table.insert(new_lines, 'modified: ' .. current_time)
        updated = true
      else
        table.insert(new_lines, line)
      end
    end

    if updated then
      vim.api.nvim_buf_set_lines(0, 0, -1, false, new_lines)
    end
  end,
})
