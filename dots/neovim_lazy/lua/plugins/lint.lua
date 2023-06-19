return { 'mfussenegger/nvim-lint',
  event = "BufReadPost",
  config = function()
    require('lint').linters_by_ft = {
      clojure = { 'clj-kondo' }
    }
    require('lint').try_lint()
    vim.api.nvim_create_autocmd({ 'TextChanged' }, {
      callback = function()
        require('lint').try_lint()
      end,
    })
  end
}
