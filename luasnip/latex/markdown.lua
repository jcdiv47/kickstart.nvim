local ls = require 'luasnip'
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
  s('align', {
    t '\\begin{{align*}}',
    i(1, 'insert...'),
    t '\\end{{align*}}',
  }),
  s('frac', {
    t '\\frac{',
    i(1, ''),
    t '}{',
    i(2, ''),
    t '}',
  }),
}
