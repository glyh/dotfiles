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

vim.o.shell = "fish"
vim.o.shellcmdflag = ('--init-command="set PATH %s" -Pc'):format(vim.env.PATH)
