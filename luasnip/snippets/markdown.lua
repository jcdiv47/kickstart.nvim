local ls = require 'luasnip'
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local conds = require 'luasnip.extras.conditions'
local conds_expand = require 'luasnip.extras.conditions.expand'

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

return {
  s('date', {
    f(get_date, {}),
  }),
  frontmatter_snip,
  detail_snip,
  s('tag', {
    t { 'tags:', '  - ' },
    i(1, 'insert tags here...'),
  }),
  s('cond2', {
    t 'will only expand at the beginning of the line',
  }, {
    condition = conds_expand.line_begin,
  }),
}
