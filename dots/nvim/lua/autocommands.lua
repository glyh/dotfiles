vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  group = "filetypedetect",
  pattern = "Dockerfile*",
  callback = function()
    vim.bo.filetype = "dockerfile"
  end,
})

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  group = "filetypedetect",
  pattern = "*.mly",
  callback = function()
    vim.bo.filetype = "ocaml.menhir"
  end,
})

vim.api.nvim_create_augroup("!!!UserHack", { clear = true })

vim.api.nvim_create_autocmd("BufWritePre", {
  group = "!!!UserHack",
  pattern = "*",
  callback = function(args)
    local file = args.file
    local buftype = vim.bo[args.buf].buftype
    if buftype == "" and not file:match "^%w+:/" then
      local dir = vim.fn.fnamemodify(file, ":h")
      if vim.fn.isdirectory(dir) == 0 then
        vim.fn.mkdir(dir, "p")
      end
    end
  end,
})
