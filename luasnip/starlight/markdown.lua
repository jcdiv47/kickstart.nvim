local ls = require 'luasnip'
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local fmt = require('luasnip.extras.fmt').fmt
local fmta = require('luasnip.extras.fmt').fmta

return {
  s('import', {
    t 'import { ',
    i(1),
    t " } from '@astrojs/starlight/components';",
  }),
}
