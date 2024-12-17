local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    dart = { "dart_format" },
    -- css = { 'prettier' },
    -- html = { 'prettier' },
    -- cpp = { "clang-format" },
    cmake = { "cmake_format" },
    ocaml = { "ocamlformat" },
  },

  format_after_save = function(bufnr)
    -- Disable "format_on_save lsp_fallback" for languages that don't
    -- have a well standardized coding style. You can add additional
    -- languages here or re-enable it for the disabled ones.
    local disable_filetypes = { crystal = true }
    if disable_filetypes[vim.bo[bufnr].filetype] then
      return { lsp_format = "never" }
    else
      return { lsp_format = "fallback" }
    end
  end,
}

require("conform").setup(options)
