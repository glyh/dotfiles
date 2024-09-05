require "nvchad.options"

local o = vim.o
o.cmdheight = 0

vim.filetype.add {
  extension = {
    lalrpop = "lalrpop",
  },
}
