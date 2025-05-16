local ls = require 'luasnip'
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local fmt = require('luasnip.extras.fmt').fmt
local fmta = require('luasnip.extras.fmt').fmta

-- keymaps for switching between choices
vim.keymap.set({ 'i', 's' }, '<C-l>', function()
  if ls.choice_active() then
    ls.change_choice(1)
  end
end)
vim.keymap.set({ 'i', 's' }, '<C-h>', function()
  if ls.choice_active() then
    ls.change_choice(-1)
  end
end)

local function get_date()
  return os.date '%Y-%m-%dT%H:%M:%S+08:00'
end

local frontmatter_snip = s('frontmatter', {
  t { '---', 'title: ' },
  i(1, 'insert title here...'),
  t { '', 'date: ' },
  f(get_date, {}),
  t { '', 'modified: ' },
  f(get_date, {}),
  t { '', '---', '' },
  i(2),
})

local detail_snip = s('detail', {
  t { '<details><summary>' },
  i(1, 'insert summary here...'),
  t { '</summary>', '', '' },
  i(2, 'insert details here...'),
  t { '', '</details>' },
})

local callout_snip = s('callout', {
  t '> [!',
  c(1, {
    t { 'info' },
    t { 'tip' },
    t { 'warn' },
    t { 'question' },
    t { 'quote' },
  }),
  t '] ',
  i(2, 'insert callout title...'),
  t { '', '> ', '> ' },
  i(3, 'insert callout content...'),
})

local readme_snip = s('readme', {
  t { '> [!readme] Readme', '> ' },
  t { '', '> - ' },
  i(1, 'insert readme list...'),
})

return {
  s('date', {
    f(get_date, {}),
  }),
  frontmatter_snip,
  detail_snip,
  callout_snip,
  readme_snip,
  s('tag', {
    t { 'tags:', '  - ' },
    i(1, 'insert tags here...'),
  }),
  s('link', {
    t '[',
    i(1, 'insert title...'),
    t ']',
    t '(',
    i(2, 'insert link...'),
    t ')',
  }),
}
