local function make_non_existent_dir(file, buf)
  local buftype = vim.bo[buf].buftype
  -- Check for empty buftype and that the file path is not a URI (like http:// or file://)
  if buftype == "" and not file:match "^%w+:/" then
    local dir = vim.fn.fnamemodify(file, ":h")
    if vim.fn.isdirectory(dir) == 0 then
      vim.fn.mkdir(dir, "p")
    end
  end
end

-- Create the autocommand
vim.api.nvim_create_augroup("BWCCreateDir", { clear = true })
vim.api.nvim_create_autocmd("BufWritePre", {
  group = "BWCCreateDir",
  pattern = "*",
  callback = function(args)
    make_non_existent_dir(args.file, args.buf)
  end,
})

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = "Dockerfile*",
  callback = function()
    vim.bo.filetype = "dockerfile"
  end,
})
