require "nvchad.options"

local o = vim.o
o.cmdheight = 0

vim.filetype.add {
  extension = {
    lalrpop = "lalrpop",
    g = "antlr3",
    g4 = "antlr4",
  },
}
