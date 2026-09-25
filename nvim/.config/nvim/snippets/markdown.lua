local ls = require("luasnip")
local s, i = ls.snippet, ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt

return {
  s("opg", fmt([[
\begin{opg}

\end{opg}
  ]], { i(1, "1"), i(2), i(0) }, { delimiters = "<>" })),
}
