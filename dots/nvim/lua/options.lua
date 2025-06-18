require "nvchad.options"

vim.o.cmdheight = 0
vim.o.shell = "fish"
vim.o.shellcmdflag = ('--init-command="set PATH %s" -Pc'):format(vim.env.PATH)
