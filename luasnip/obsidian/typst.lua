local ls = require 'luasnip'
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local fmt = require('luasnip.extras.fmt').fmt
local fmta = require('luasnip.extras.fmt').fmta

local codeblock_snip = s('code', {
  t { '#line(length: 100%)', '```python', '' },
  i(1, ''),
  t { '', '```' },
  i(2),
})

return {
  codeblock_snip,
}
